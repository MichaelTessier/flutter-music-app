import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_app/models/song.dart';
import 'package:music_app/widgets/album_thumbnail.dart';

class PlayerFloatingBar extends StatefulWidget {
  final Song song;

  const PlayerFloatingBar({
    super.key,
    required this.song,
  });

  @override
  PlayerFloatingBarState createState () => PlayerFloatingBarState();
}

class PlayerFloatingBarState extends State<PlayerFloatingBar> {
  double borderRadius = 5;

  late AudioPlayer audioPlayer;
  bool isPlaying = false;
  bool isFetching = false;
  bool isPaused = false;
  late Duration audioPlayerPosition;
  Duration? songDuration = const Duration(seconds: 0);
  double audioPlayerDurationPercent = 0;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    audioPlayerInit();

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

    audioPlayer.onDurationChanged.listen((Duration duration) {
      songDuration = duration;
    });

    audioPlayer.onPositionChanged.listen((Duration position) {
      setState(() {
        if(songDuration == null) return;

        audioPlayerPosition = position;
        audioPlayerDurationPercent = toPercent(position.inSeconds.toDouble(), songDuration!.inSeconds.toDouble());
      });
    });
  }

  @override
  void dispose() {
    audioPlayerDispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant PlayerFloatingBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    audioPlayerInit();
    audioPlayerPlay();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      alignment: AlignmentDirectional.bottomStart,
      children: [
        Container(
          height: 60,
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.9),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(borderRadius), topRight: Radius.circular(borderRadius))
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                AlbumThumbnail(album: widget.song.album),
                const Padding(padding: EdgeInsets.only(right: 10)),
                Expanded(
                  child: Text(
                    widget.song.title,
                    overflow: TextOverflow.ellipsis,
                  )
                ),
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
                          : audioPlayerPlay();
                    },
                    icon: Icon(iconPlayState())
                )
              ],
            ),
          )
        ),
        Container(
          width: size.width * (audioPlayerDurationPercent/100),
          height: 3,
          color: Colors.orange,
        )
      ],
    );
  }

  IconData iconPlayState () {
    if(isFetching) return Icons.pending;
    // if(isPlaying) return Icons.stop;
    if(isPlaying) return Icons.pause;
    return Icons.play_arrow;
  }

  double toPercent (double part, double total) {
    return (part / total) * 100;
  }

  void audioPlayerInit() async {
    await audioPlayer.setSourceUrl(widget.song.path);
    Duration? duration  = await audioPlayer.getDuration();
    songDuration = duration;

  }

  void audioPlayerDispose() async {
    await audioPlayer.dispose();
    // TODO use cache and clean it
  }

  void audioPlayerPlay() async {
    await audioPlayer.play(UrlSource(widget.song.path));

  }
}