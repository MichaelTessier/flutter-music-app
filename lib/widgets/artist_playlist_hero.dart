import 'package:flutter/material.dart';
import 'package:music_app/controllers/data_controller.dart';
import 'package:music_app/models/artist.dart';
import 'package:music_app/services/artist_service.dart';

class ArtistPlayListHero extends StatefulWidget {
  final int id;

  const ArtistPlayListHero({
    super.key,
    required this.id,
  });

  @override
  ArtistPlayListHeroState createState() => ArtistPlayListHeroState();
}

class ArtistPlayListHeroState extends State<ArtistPlayListHero> {
  late Future<Artist> futureArtist;

  @override
  void initState() {
    super.initState();
    futureArtist = ArtistService().fetchById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return DataController(
      future: futureArtist,
      successWidget: (artist) {
        return Container(
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(artist.imageUrl)
            )
          ),
        );
      }
    );
  }
}