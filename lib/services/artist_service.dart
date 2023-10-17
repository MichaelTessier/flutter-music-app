import 'package:music_app/data/artist_data.dart';
import 'package:music_app/models/artist.dart';

class ArtistService {
  fetchAll () {
    return artistData;
  }
  Future<Artist> fetchById(int id) {
    Artist artist = artistData.firstWhere((artist) => artist.id == id);

    return Future.delayed(const Duration(milliseconds: 500))
        .then((onValue) => artist);
  }

  // For fake relational
  getArtistById (id) {
    return artistData.firstWhere((artist) => artist.id == id);
  }
  get eminem => getArtistById(1);
  get tuPac => getArtistById(2);
  get mozart => getArtistById(4);
  get smashingPumpkins => getArtistById(3);

}