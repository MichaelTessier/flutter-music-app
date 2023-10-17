import 'package:flutter/material.dart';
import 'package:music_app/models/album.dart';
import 'package:music_app/models/genre.dart';
import 'package:music_app/models/song.dart';

class PlayListSongItem extends StatelessWidget {
  final Song song;
  final bool hasGenre;
  final bool hasAlbum;

  const PlayListSongItem({
    super.key,
    required this.song,
    this.hasAlbum = false,
    this.hasGenre = false,
  });

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
                hasAlbum ? AlbumThumbnail(album: song.album) : Container(),
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
                      Row(
                        children: [
                          Text(
                              song.artist.name,
                              style: Theme.of(context).textTheme.bodySmall
                          ),
                          Padding(padding: EdgeInsets.all(5)),
                          hasGenre ? GenreBadge(genre: song.genre) : Container()
                        ],
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

class GenreBadge extends StatelessWidget {
  Genre genre;

  // TODO sizing
  GenreBadge({ super.key, required this.genre });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: genre.colorFromRgb(),
        borderRadius: BorderRadius.circular(5)
      ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
            child: Text(genre.name, style: Theme.of(context).textTheme.bodySmall,)
          ),
        )
    );
  }
}

class AlbumThumbnail extends StatelessWidget {
  Album album;

  AlbumThumbnail({ super.key, required this.album });

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