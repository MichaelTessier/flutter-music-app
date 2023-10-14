import 'package:music_app/data/song_data.dart';
import 'package:music_app/models/song.dart';

class SongService {
  List<Song> fetchAll() {
    return songData;
  }

  Future<List<Song>> fetchByAlbum(int id) {
    List<Song> songList = songData.where((song) => song.album.id == id).toList();

    return Future.delayed(const Duration(milliseconds: 500))
        .then((onValue) => songList);
  }

  Future<List<Song>> fetchByGenre(int id) {
    List<Song> songList = songData.where((song) => song.genre.id == id).toList();

    return Future.delayed(const Duration(milliseconds: 500))
        .then((onValue) => songList);
  }

  Future<List<Song>> fetchByArtist(int id) {
    List<Song> songList = songData.where((song) => song.artist.id == id).toList();

    return Future.delayed(const Duration(milliseconds: 500))
        .then((onValue) => songList);
  }
}