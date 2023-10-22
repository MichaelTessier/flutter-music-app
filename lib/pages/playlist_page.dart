import 'package:flutter/material.dart';
import 'package:music_app/controllers/data_controller.dart';
import 'package:music_app/models/playlist.dart';
import 'package:music_app/models/song.dart';
import 'package:music_app/services/song_service.dart';
import 'package:music_app/widgets/album_playlist_hero.dart';
import 'package:music_app/widgets/artist_playlist_hero.dart';
import 'package:music_app/widgets/player_floating_bar.dart';
import 'package:music_app/widgets/playlist_song_item.dart';
import 'package:music_app/widgets/genre_playlist_hero.dart';
import 'package:music_app/widgets/playlist_template.dart';

class PlayListPage extends StatefulWidget {
  final PlayListType type;
  final int queryID;

  const PlayListPage({
    super.key,
    required this.type,
    required this.queryID,
  });


  @override
  PlaylistPageState createState() => PlaylistPageState();
}

class PlaylistPageState extends State<PlayListPage> {
  late Future<List<Song>> futureSongList;
  Song? currentSong;
  int? songPlayingId;

  final Map<PlayListType, Function> playlistRequest = {
    PlayListType.album:  (int id) => SongService().fetchByAlbum(id),
    PlayListType.artist: (int id) => SongService().fetchByArtist(id),
    PlayListType.genre: (int id) => SongService().fetchByGenre(id),
  };

  final Map<PlayListType, Function> playlistHero = {
    PlayListType.album: (int id) => AlbumPlayListHero(id: id),
    PlayListType.artist: (int id) => ArtistPlayListHero(id: id),
    PlayListType.genre: (int id) => GenrePlayListHero(id: id),
  };

  final Map<PlayListType, Function> playlistListItem = {
    PlayListType.album: (Song song, onSongSelect, Song currentSong) => PlayListSongItem(
      song: song,
      onSongSelect: () => onSongSelect(song),
      isPlaying: currentSong.id == song.id
    ),
    PlayListType.artist: (Song song, Function onSongSelect, Song currentSong) => PlayListSongItem(
        song: song,
        hasAlbum: true,
        hasGenre: true,
        onSongSelect: () => onSongSelect(song),
        isPlaying: currentSong.id == song.id
    ),
    PlayListType.genre: (Song song, Function onSongSelect, Song currentSong) => PlayListSongItem(
        song: song,
        hasAlbum: true,
        onSongSelect: () => onSongSelect(song),
        isPlaying: currentSong.id == song.id
    ),
  };

  @override
  void initState() {
    super.initState();
    futureSongList = playlistRequest[widget.type]?.call(widget.queryID);
    futureSongList.then((value) => setState(() => currentSong = value.first));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
            DataController(
              future: futureSongList,
              successWidget: (songList) => PlaylistTemplate(
                  hero: playlistHero[widget.type] != null
                      ? playlistHero[widget.type]?.call(widget.queryID)
                      : Container(),
                  listItem: (index) {
                    return playlistListItem[widget.type] != null
                        ? playlistListItem[widget.type]?.call(
                          songList[index],
                          (song) => setState(() => currentSong = songList[index]),
                          currentSong
                        )
                        : Container();
                  },
                  songList: songList
              ),
            ),
            currentSong != null
                ? PlayerFloatingBar(
                  song: currentSong!,
                )
                : Container()
        ],
      )
    );
  }
}