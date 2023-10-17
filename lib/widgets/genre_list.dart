import 'package:flutter/material.dart';
import 'package:music_app/models/genre.dart';
import 'package:music_app/services/genre_service.dart';
import 'package:music_app/widgets/genre_card.dart';
import 'package:music_app/widgets/list_section.dart';

class GenreList extends StatelessWidget {
  GenreList({super.key});

  final List<Genre> genreList = GenreService().fetchAll();

  @override
  Widget build(BuildContext context) {
    return ListSection(
      title: 'Genres',
      widget: SizedBox(
        height: 90,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: genreList.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(right: 20),
                child: GenreCard(genre: genreList[index]),
              );
            }
        ),
      ),
    );
  }
}