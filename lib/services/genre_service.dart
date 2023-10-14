import 'package:music_app/data/genre_data.dart';

class GenreService {
  fetchAll () {
    return genreData;
  }

  // For fake relational
  get classic => GenreService().getGenreById(4);
  get rap => GenreService().getGenreById(1);
  get rock => GenreService().getGenreById(3);
  getGenreById (id) {
    return genreData.firstWhere((genre) => genre.id == id);
  }
}