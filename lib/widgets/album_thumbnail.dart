import 'package:flutter/material.dart';
import 'package:music_app/models/album.dart';

class AlbumThumbnail extends StatelessWidget {
  final Album album;

  const AlbumThumbnail({ super.key, required this.album });

  final double albumSize = 50; // TODO sizing

  @override
  Widget build(BuildContext context) {
    return Container(
      width: albumSize,
      height: albumSize,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(album.coverUrl),
              fit: BoxFit.cover
          ),
          borderRadius: BorderRadius.circular(5)
      ),
    );
  }
}