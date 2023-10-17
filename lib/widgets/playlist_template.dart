import 'package:flutter/material.dart';
import 'package:music_app/models/song.dart';

class PlaylistTemplate extends StatelessWidget {

  final List<Song> songList;
  final Widget hero;
  final Widget Function(int) listItem;

  const PlaylistTemplate({
    super.key,
    required this.songList,
    required this.hero,
    required this.listItem,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        hero,
        Expanded(
          child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return listItem(index);
              },
              itemCount: songList.length
          )
        )

      ],
    );
  }
}