import 'package:flutter/material.dart';
import 'package:music_app/models/genre.dart';

class GenreCard extends StatelessWidget {
  final Genre genre;

  const GenreCard({super.key, required this.genre});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: 180,
            height: 70,
            decoration: BoxDecoration(
              color: genre.colorFromRgb(),
              borderRadius: BorderRadius.circular(10)
            ),
            child: Center(
              child: Text(genre.name, style: Theme.of(context).textTheme.headlineSmall),
            ),
          ),
        ],
      )
    );
  }
}