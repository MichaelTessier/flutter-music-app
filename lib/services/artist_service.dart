import 'package:music_app/data/artist_data.dart';

class ArtistService {
  fetchAll () {
    return artistData;
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