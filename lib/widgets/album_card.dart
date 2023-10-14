import 'package:flutter/material.dart';
import 'package:music_app/models/album.dart';

class AlbumCard extends StatelessWidget {
  final Album album;

  const AlbumCard({super.key, required this.album});

  @override
  Widget build(BuildContext context) {
    double size = 120;
    return InkWell(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(album.coverUrl),
                  fit: BoxFit.cover
                ),
                borderRadius: BorderRadius.circular(10)
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 10)),
          SizedBox(
            width: size,
            height: 15,
            child: Text(
              album.name,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      )
    );
  }
}