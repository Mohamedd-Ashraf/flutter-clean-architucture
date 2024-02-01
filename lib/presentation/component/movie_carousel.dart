// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:data_session/core/constants.dart';
import 'package:data_session/presentation/screens/movie_details.dart';
import 'package:flutter/material.dart';
import '../../domin/entites/movies.dart';
class MovieCarousel extends StatelessWidget {
  final List<Movies> movies;
  bool autoPlay  , now_playing  ; 

  MovieCarousel({
    Key? key,
    required this.movies,
    required this.autoPlay,
    required this.now_playing
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: 500),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 400.0,
          viewportFraction: 1.0,
          onPageChanged: (index, reason) {},
          autoPlay: autoPlay,
          autoPlayInterval: const Duration(seconds: 5),
          autoPlayAnimationDuration: const Duration(milliseconds: 1000),
        ),
        items: movies.map(
          (movie) {
            return GestureDetector(
              key: const Key('openMovieMinimalDetail'),
              onTap: () {
          //TODO: TASK Navigate to Movie Details Screen
       },
              child: Stack(
                children: [
                  ShaderMask(
                    shaderCallback: (rect) {
                      return const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black,
                          Colors.black,
                          Colors.transparent,
                        ],
                        stops: [0, 0.3, 0.5, 1],
                      ).createShader(
                        Rect.fromLTRB(0, 0, rect.width, rect.height),
                      );
                    },
                    blendMode: BlendMode.dstIn,
                    child: CachedNetworkImage(
                      height: 560.0,
                      imageUrl: AppConstants.imageUrl(movie.backdropPath),
                      fit: BoxFit.cover,
                    ),
                  ),
                  now_playing?
                  Align(

                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.circle,
                                color: Colors.redAccent,
                                size: 16.0,
                              ),
                              const SizedBox(width: 4.0),
                              Text(
                                'Now Playing'.toUpperCase(),
                                style: const TextStyle(
                                    fontSize: 16.0, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Text(
                            movie.title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ):Container()
                ],
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}