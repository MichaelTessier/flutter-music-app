import 'package:music_app/models/album.dart';
import 'package:music_app/models/artist.dart';
import 'package:music_app/models/genre.dart';
import 'package:music_app/models/media_type.dart';

class Song {
  int id;
  String title;
  int artistId;
  int albumId;
  String path;
  Genre genre;
  MediaType mediaType;

  Song({
    required this.id,
    required this.title,
    required this.artistId,
    required this.albumId,
    required this.path,
    required this.genre,
    required this.mediaType,
  });
}