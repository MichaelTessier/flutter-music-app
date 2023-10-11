import 'package:music_app/models/genre.dart';
import 'package:music_app/models/media_type.dart';
import 'package:music_app/models/song.dart';

List<Song> songData = [
  Song(id: 1, title: 'Symphonie numéro 40', artistId: 4, albumId: 4, path: 'allegro.mp3', genre: Genre.classic, mediaType: MediaType.inApp),

  Song(id: 2, title: 'New York State Of Mind - 2pac Feat Nas Jay-Z', artistId: 2, albumId: 1, path: 'https://archive.org/download/2pac_-_Tupac_Duets/02%29%20New%20York%20State%20Of%20Mind%20-%202pac%20Feat%20Nas%20%20Jay-Z.mp3', genre: Genre.rap, mediaType: MediaType.internet),
  Song(id: 3, title: 'Dear Mama part 2', artistId: 2, albumId: 1, path: 'https://archive.org/download/2pac_-_Tupac_Duets/14%29%20Dear%20Mama%20Part%20II%20-%202pac%20Feat%20Eminem.mp3', genre: Genre.rap, mediaType: MediaType.internet),
  Song(id: 4, title: 'I never Change', artistId: 2, albumId: 1, path: 'https://archive.org/download/2pac_-_Tupac_Duets/09%29%20I%20Never%20Change%20-%202pac%20Feat%20Jadakiss%20The%20Game%20%20C.mp3', genre: Genre.rap, mediaType: MediaType.internet),

  Song(id: 5, title: 'The way you lie (ft. Rihanna)', artistId: 1, albumId: 2, path: 'https://archive.org/download/Eminem_-_A_Beautiful_Mind/01%29%20Eminem%20-%20The%20Way%20You%20Lie%20Pt.%202%20%28Feat.%20Rihanna%29.mp3', genre: Genre.rap, mediaType: MediaType.internet),
  Song(id: 6, title: 'Roman\'s Revenge (Feat. Nicki Minaj)', artistId: 1, albumId: 2, path: 'https://archive.org/download/Eminem_-_A_Beautiful_Mind/02%29%20Eminem%20-%20Roman%27s%20Revenge%20%28Feat.%20Nicki%20Minaj%29.mp3', genre: Genre.rap, mediaType: MediaType.internet),
  Song(id: 7, title: 'The Cypher', artistId: 1, albumId: 2, path: 'https://archive.org/download/Eminem_-_A_Beautiful_Mind/03%29%20Eminem%20-%20The%20Cypher.mp3', genre: Genre.rap, mediaType: MediaType.internet),
  Song(id: 8, title: 'No Love (Feat. Lil\' Wayne)', artistId: 1, albumId: 2, path: 'https://archive.org/download/Eminem_-_A_Beautiful_Mind/04%29%20Eminem%20-%20No%20Love%20%28Feat.%20Lil%27%20Wayne%29.mp3', genre: Genre.rap, mediaType: MediaType.internet),
  Song(id: 9, title: 'Drop The Bomb On \'Em', artistId: 1, albumId: 2, path: 'https://archive.org/download/Eminem_-_A_Beautiful_Mind/05%29%20Eminem%20-%20Drop%20The%20Bomb%20On%20%27Em.mp3', genre: Genre.rap, mediaType: MediaType.internet),
  Song(id: 10, title: 'The Warning', artistId: 1, albumId: 2, path: 'https://archive.org/download/Eminem_-_A_Beautiful_Mind/06%29%20Eminem%20-%20The%20Warning.mp3', genre: Genre.rap, mediaType: MediaType.internet),

  Song(id: 11, title: 'Rocket', artistId: 3, albumId: 3, path: 'https://archive.org/download/tsp1993-07-26.fm.flacf/01%20-%20Rocket.mp3', genre: Genre.rock, mediaType: MediaType.internet),
  Song(id: 12, title: 'Cherub Rock', artistId: 3, albumId: 3, path: 'https://archive.org/download/tsp1993-07-26.fm.flacf/02%20-%20Cherub%20Rock.mp3', genre: Genre.rock, mediaType: MediaType.internet),
  Song(id: 13, title: 'Today', artistId: 3, albumId: 3, path: 'https://archive.org/download/tsp1993-07-26.fm.flacf/03%20-%20Today.mp3', genre: Genre.rock, mediaType: MediaType.internet),
  Song(id: 14, title: 'Disarm', artistId: 3, albumId: 3, path: 'https://archive.org/download/tsp1993-07-26.fm.flacf/04%20-%20Disarm.mp3', genre: Genre.rock, mediaType: MediaType.internet),

];