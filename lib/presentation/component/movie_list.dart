import 'package:animate_do/animate_do.dart';
import 'package:data_session/presentation/component/movie_item.dart';
import 'package:flutter/material.dart';

import '../../domin/entites/movies.dart';

class MovieList extends StatelessWidget {
  final String title;
  final List<Movies> movies;

  MovieList({required this.title, required this.movies});

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: 500),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () {
                    /// TODO : Navigation to Movie List Screen
                  },
                  child: const Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          'See More',
                          style: TextStyle(color: Colors.white),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16.0,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 170.0,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return MovieItem(movie: movies[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}