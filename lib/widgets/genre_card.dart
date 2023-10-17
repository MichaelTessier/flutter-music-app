import 'package:flutter/material.dart';
import 'package:music_app/models/genre.dart';
import 'package:music_app/models/playlist.dart';
import 'package:music_app/pages/playlist_page.dart';

class GenreCard extends StatelessWidget {
  final Genre genre;

  const GenreCard({super.key, required this.genre});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
              builder: (BuildContext context) => PlayListPage(
                type: PlayListType.genre,
                queryID: genre.id,
              )
          )
      ),
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