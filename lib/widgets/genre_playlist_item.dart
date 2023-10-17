import 'package:flutter/material.dart';
import 'package:music_app/models/song.dart';

class GenrePlayListItem extends StatelessWidget {
  final Song song;

  GenrePlayListItem({ super.key, required this.song});

  final double albumSize = 50;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: albumSize,
                  height: albumSize,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(song.album.coverUrl),
                      fit: BoxFit.cover
                    ),
                    borderRadius: BorderRadius.circular(5)
                  ),
                ),
                const Padding(padding: EdgeInsets.only(right: 5)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        song.title,
                        overflow: TextOverflow.ellipsis
                      ),
                      const Padding(padding: EdgeInsets.all(5)),
                      Text(
                        song.artist.name,
                        style: Theme.of(context).textTheme.bodySmall
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.more_vert)
        ],
      ),
    );
  }
}