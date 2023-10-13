import 'package:flutter/material.dart';
import 'package:music_app/models/artist.dart';
import 'package:music_app/services/artist_service.dart';
import 'package:music_app/widgets/artist_card.dart';
import 'package:music_app/widgets/list_section.dart';

class ArtistList extends StatelessWidget {
  ArtistList({super.key});

  final List<Artist> artistList = ArtistService().fetchAll();

  @override
  Widget build(BuildContext context) {
    return ListSection(
      title: 'Artists',
      widget: SizedBox(
        height: 160,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: artistList.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                  padding: EdgeInsets.only(right: 20),
                child: ArtistCard(artist: artistList[index]),
              );
            }
        ),
      ),
    );
  }
}