import 'package:music_app/models/album.dart';
import 'package:music_app/services/artist_service.dart';
import 'package:music_app/services/genre_service.dart';

List<Album> albumData = [
  Album(id: 1, name: 'Duets', artist: ArtistService().tuPac, coverUrl: 'https://i.ytimg.com/vi/YY5a5We5kdc/sddefault.jpg', genre: GenreService().rap),
  Album(id: 2, name: 'A beautiful mind', artist: ArtistService().eminem, coverUrl: 'https://lastfm.freetls.fastly.net/i/u/500x500/51374f1973c5461f896009e9add49438.jpg', genre: GenreService().rap),
  Album(id: 3, name: 'Live Chicago', artist: ArtistService().smashingPumpkins, coverUrl: 'https://ia902303.us.archive.org/27/items/tsp1993-07-26.fm.flacf/sp1993-07-26.fm.jpg?cnt=0', genre: GenreService().rock),
  Album(id: 4, name: 'Best Of Mozart', artist: ArtistService().mozart, coverUrl: 'https://www.musicologie.org/Biographies/m/mozart.jpg', genre: GenreService().classic),
];
