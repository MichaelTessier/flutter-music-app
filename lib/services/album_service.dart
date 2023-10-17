import 'package:music_app/data/album_data.dart';
import 'package:music_app/models/album.dart';

class AlbumService {
  List<Album> fetchAll() {
    return albumData;
  }

  Future<Album> fetchById(int id) {
    Album album = albumData.firstWhere((album) => album.id == id);

    return Future.delayed(const Duration(milliseconds: 500))
        .then((onValue) => album);
  }

  // For fake relational
  getAlbumById (id) {
    return albumData.firstWhere((album) => album.id == id);
  }

  get bestOfMozart => getAlbumById(4);
  get duets => getAlbumById(1);
  get aBeautifulMind => getAlbumById(2);
  get liveChicago => getAlbumById(3);
}