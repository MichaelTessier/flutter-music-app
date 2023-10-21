import 'package:flutter/material.dart';
import 'package:music_app/models/genre.dart';
import 'package:music_app/models/song.dart';
import 'package:music_app/widgets/album_thumbnail.dart';

class PlayListSongItem extends StatelessWidget {
  final Song song;
  final bool hasGenre;
  final bool hasAlbum;
  final Function() onSongSelect;

  const PlayListSongItem({
    super.key,
    required this.song,
    required this.onSongSelect,
    this.hasAlbum = false,
    this.hasGenre = false,

  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onSongSelect(),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  hasAlbum
                      ? AlbumThumbnail(album: song.album)
                      : Container(),
                  const Padding(padding: EdgeInsets.only(right: 5)),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            song.title,
                            overflow: TextOverflow.ellipsis
                        ),
                        const Padding(padding: EdgeInsets.all(3)),
                        Row(
                          children: [
                            Text(
                                song.artist.name,
                                style: Theme.of(context).textTheme.bodySmall
                            ),
                            const Padding(padding: EdgeInsets.all(5)),
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
      ),
    );
  }
}

class GenreBadge extends StatelessWidget {
  final Genre genre;

  // TODO sizing
  const GenreBadge({ super.key, required this.genre });

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
