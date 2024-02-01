// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:data_session/core/services/services_locator.dart';
import 'package:data_session/presentation/controller/movies_cubit.dart';
import 'package:data_session/presentation/controller/movies_states.dart';

import '../component/movie_carousel.dart';
import '../component/movie_list.dart';


class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MoviesCubit>()
        ..getNowPlayingMovies()
        ..getPopularMovies()
        ..getTopRatedMovies(),
      child: BlocConsumer<MoviesCubit, MoviesStates>(
        builder: (context, state) {
          MoviesCubit cubit = MoviesCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.grey.shade900,
            body: SingleChildScrollView(
              key: const Key('movieScrollView'),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MovieCarousel(movies: cubit.nowPlayingMovies , autoPlay: true ,  now_playing:  true),
                  MovieList(title: "Popular", movies: cubit.popularMovies),
                  //TODO display Top Rated Movies
                  const SizedBox(height: 50.0),
                ],
              ),
            ),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}

