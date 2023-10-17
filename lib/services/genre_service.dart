import 'package:music_app/data/genre_data.dart';
import 'package:music_app/models/genre.dart';

class GenreService {
  fetchAll () {
    return genreData;
  }

  Future<Genre> fetchById(int id) {
    Genre genre = genreData.firstWhere((genre) => genre.id == id);

    return Future.delayed(const Duration(milliseconds: 500))
        .then((onValue) => genre);
  }

  // For fake relational
  get classic => GenreService().getGenreById(4);
  get rap => GenreService().getGenreById(1);
  get rock => GenreService().getGenreById(3);
  getGenreById (id) {
    return genreData.firstWhere((genre) => genre.id == id);
  }
}