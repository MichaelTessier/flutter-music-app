import 'package:music_app/models/album.dart';
import 'package:music_app/models/genre.dart';

List<Album> albumData = [
  Album(id: 1, name: 'Duets', artistId: 2, coverUrl: 'https://i.ytimg.com/vi/YY5a5We5kdc/sddefault.jpg', genre: Genre.rap),
  Album(id: 2, name: 'A beautiful mind', artistId: 1, coverUrl: 'https://lastfm.freetls.fastly.net/i/u/500x500/51374f1973c5461f896009e9add49438.jpg', genre: Genre.rap),
  Album(id: 3, name: 'Live Chicago', artistId: 3, coverUrl: 'https://ia902303.us.archive.org/27/items/tsp1993-07-26.fm.flacf/sp1993-07-26.fm.jpg?cnt=0', genre: Genre.rock),
  Album(id: 4, name: 'Best Of Mozart', artistId: 4, coverUrl: 'https://www.musicologie.org/Biographies/m/mozart.jpg', genre: Genre.classic),
];
