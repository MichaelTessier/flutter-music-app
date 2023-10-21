import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_app/models/song.dart';
import 'package:music_app/widgets/album_thumbnail.dart';

class PlayerFloatingBar extends StatefulWidget {
  final Song song;

  const PlayerFloatingBar({super.key, required this.song});

  @override
  PlayerFloatingBarState createState () => PlayerFloatingBarState();
}

class PlayerFloatingBarState extends State<PlayerFloatingBar> {
  late AudioPlayer audioPlayer;
  bool isPlaying = false;
  bool isFetching = false;
  bool isPaused = false;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();

    audioPlayer.onPlayerStateChanged.listen((state) {
      switch (state) {
        case PlayerState.playing:
          if (!mounted) return;

          setState(() {
            isFetching = false;
            isPaused = false;
            isPlaying = true;
          });
        case PlayerState.stopped:
          if (!mounted) return;

          setState(() {
            isFetching = false;
            isPaused = false;
          });
          // audioPlayerDispose();
        case PlayerState.paused:
          if (!mounted) return;

          setState(() {
            isFetching = false;
            isPlaying = false;
            isPaused = true;
          });
        case PlayerState.completed:
          isPlaying = true;
        case PlayerState.disposed:
        default:
          break;
      }
    });
  }

  @override
  void dispose() {
    audioPlayerDispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.9),
          borderRadius: const BorderRadius.all(Radius.circular(5))
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            AlbumThumbnail(album: widget.song.album),
            const Padding(padding: EdgeInsets.only(right: 10)),
            Expanded(child: Text(
              widget.song.title,
              overflow: TextOverflow.ellipsis,
            )),
            IconButton(
                onPressed: () {
                  Future
                    .delayed(const Duration(milliseconds: 200))
                    .then((onValue) {
                        if(isPaused) return;
                        if(!isPlaying) setState(() => isFetching = true);
                    });

                  isPlaying
                      ? audioPlayer.pause()
                      : audioPlayer.play(UrlSource(widget.song.path));
                },
                icon: Icon(iconPlayState())
            )
          ],
        ),
      )
    );
  }

  IconData iconPlayState () {
    if(isFetching) return Icons.pending;
    // if(isPlaying) return Icons.stop;
    if(isPlaying) return Icons.pause;
    return Icons.play_arrow;
  }

  void audioPlayerDispose () {
    audioPlayer.dispose();
    // TODO use cache and clean it
  }
}