import 'package:flutter/material.dart';
import 'package:music_app/models/album.dart';
import 'package:music_app/services/album_service.dart';
import 'package:music_app/widgets/album_card.dart';
import 'package:music_app/widgets/list_section.dart';

class AlbumList extends StatelessWidget {
  AlbumList({super.key});

  final List<Album> albumList = AlbumService().fetchAll();

  @override
  Widget build(BuildContext context) {
    return ListSection(
      title: 'Albums',
      widget: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 0.9,
          ),
          // scrollDirection: Axis.vertical,
          itemCount: albumList.length,
          itemBuilder: (BuildContext context, int index) {
             return AlbumCard(album: albumList[index]);
          },
        ),
    );
  }
}