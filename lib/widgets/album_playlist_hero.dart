import 'package:flutter/material.dart';
import 'package:music_app/controllers/data_controller.dart';
import 'package:music_app/models/album.dart';
import 'package:music_app/services/album_service.dart';

class AlbumPlayListHero extends StatefulWidget {
  final int id;

  const AlbumPlayListHero({
    super.key,
    required this.id,
  });

  @override
  AlbumPlayListHeroState createState() => AlbumPlayListHeroState();
}

class AlbumPlayListHeroState extends State<AlbumPlayListHero> {
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = AlbumService().fetchById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return DataController(
      future: futureAlbum,
      successWidget: (album) {
        return Container(
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(album.coverUrl)
            )
          ),
        );
      }
    );
  }
}