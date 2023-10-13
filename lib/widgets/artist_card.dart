import 'package:flutter/material.dart';
import 'package:music_app/models/artist.dart';

class ArtistCard extends StatelessWidget {
  final Artist artist;

  const ArtistCard({super.key, required this.artist});

  @override
  Widget build(BuildContext context) {
    double size = 120;
    return InkWell(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(artist.imageUrl),
                fit: BoxFit.cover
              ),
              borderRadius: BorderRadius.circular(10)
            ),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 10)),
          SizedBox(
            width: size,
            child: Text(
              artist.name,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      )
    );
  }
}