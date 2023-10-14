import 'package:flutter/material.dart';
import 'package:music_app/models/song.dart';

class AlbumPlayListItem extends StatelessWidget {
  Song song;

  AlbumPlayListItem({ super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(song.title),
              const Padding(padding: EdgeInsets.all(5)),
              Text(song.artist.name, style: Theme.of(context).textTheme.bodySmall,)
            ],
          ),
          const Icon(Icons.more_vert)
        ],
      ),
    );
  }
}