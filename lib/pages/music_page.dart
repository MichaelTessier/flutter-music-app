import 'package:flutter/material.dart';
import 'package:music_app/widgets/album_list.dart';
import 'package:music_app/widgets/artist_list.dart';

class MusicPage extends StatefulWidget {

  const MusicPage({super.key});

  @override
  MusicPageState createState () => MusicPageState();
}

class MusicPageState extends State<MusicPage> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            ArtistList(),
            AlbumList(),
            // Genre List
          ],
        ),
      )
    );
  }
}