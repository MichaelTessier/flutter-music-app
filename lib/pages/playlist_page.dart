import 'package:flutter/material.dart';
import 'package:music_app/controllers/data_controller.dart';
import 'package:music_app/models/playlist.dart';
import 'package:music_app/models/song.dart';
import 'package:music_app/services/song_service.dart';
import 'package:music_app/widgets/album_playlist_hero.dart';
import 'package:music_app/widgets/album_playlist_item.dart';
import 'package:music_app/widgets/genre_playlist_hero.dart';
import 'package:music_app/widgets/genre_playlist_item.dart';
import 'package:music_app/widgets/playlist_template.dart';

class PlayListPage extends StatefulWidget {
  final PlayListType type;
  final int queryID;

  PlayListPage({
    super.key,
    required this.type,
    required this.queryID,
  });

  final Map<PlayListType, Function> playlistRequest = {
    PlayListType.album:  (int id) => SongService().fetchByAlbum(id),
    PlayListType.artist: (int id) => SongService().fetchByArtist(id),
    PlayListType.genre: (int id) => SongService().fetchByGenre(id),
  };

  final Map<PlayListType, Function> playlistHero = {
    PlayListType.album: (int id) => AlbumPlayListHero(id: id),
    PlayListType.artist: (int id) => AlbumPlayListHero(id: id), // TODO
    PlayListType.genre: (int id) => GenrePlayListHero(id: id),
  };

  final Map<PlayListType, Function> playlistListItem = {
    PlayListType.album: (Song song) => AlbumPlayListItem(song: song),
    PlayListType.artist: (Song song) => GenrePlayListItem(song: song), // TODO
    PlayListType.genre: (Song song) => GenrePlayListItem(song: song),
  };

  @override
  PlaylistPageState createState() => PlaylistPageState();
}

class PlaylistPageState extends State<PlayListPage> {
  late Future<List<Song>> futureSongList;

  @override
  void initState() {
    super.initState();
    futureSongList = widget.playlistRequest[widget.type]?.call(widget.queryID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: DataController(
        future: futureSongList,
        successWidget: (songList) => PlaylistTemplate(
          hero: widget.playlistHero[widget.type] != null
              ? widget.playlistHero[widget.type]?.call(widget.queryID)
              : Container(),
          listItem: (index) {
            return widget.playlistListItem[widget.type] != null
              ? widget.playlistListItem[widget.type]?.call(songList[index])
              : Container();
          },
          songList: songList
        ),
      )
    );
  }
}