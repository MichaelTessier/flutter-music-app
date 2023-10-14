import 'package:music_app/models/artist.dart';
import 'package:music_app/models/genre.dart';
import 'package:music_app/models/song.dart';

class Album {
  int id;
  String name;
  Artist artist;
  String coverUrl;
  Genre genre;

  Album({
    required this.id,
    required this.name,
    required this.artist,
    required this.coverUrl,
    required this.genre,
  });
}