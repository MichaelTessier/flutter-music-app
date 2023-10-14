import 'package:music_app/models/artist.dart';
import 'package:music_app/models/genre.dart';
import 'package:music_app/models/song.dart';

class Album {
  int id;
  String name;
  int artistId;
  String coverUrl;
  int genreId;

  Album({
    required this.id,
    required this.name,
    required this.artistId,
    required this.coverUrl,
    required this.genreId,
  });
}