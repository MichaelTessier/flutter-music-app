import 'package:flutter/material.dart';
import 'package:music_app/controllers/data_controller.dart';
import 'package:music_app/models/genre.dart';
import 'package:music_app/services/genre_service.dart';

class GenrePlayListHero extends StatefulWidget {
  final int id;

  const GenrePlayListHero({
    super.key,
    required this.id,
  });

  @override
  GenrePlayListHeroState createState() => GenrePlayListHeroState();
}

class GenrePlayListHeroState extends State<GenrePlayListHero> {
  late Future<Genre> futureGenre;

  @override
  void initState() {
    super.initState();
    futureGenre = GenreService().fetchById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return DataController(
      future: futureGenre,
      successWidget: (genre) {
        return Container(
          height: 150,
          color: genre.colorFromRgb(),
          child: Center(
            child: Text(genre.name, style: Theme.of(context).textTheme.headlineMedium,),
          ),
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     image: NetworkImage(album.coverUrl)
          //   )
          // ),
        );
      }
    );
  }
}