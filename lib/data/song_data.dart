import 'package:music_app/models/media_type.dart';
import 'package:music_app/models/song.dart';
import 'package:music_app/services/album_service.dart';
import 'package:music_app/services/artist_service.dart';
import 'package:music_app/services/genre_service.dart';



List<Song> songData = [
  Song(id: 1, title: 'Symphonie numéro 40', artist: ArtistService().mozart, album: AlbumService().bestOfMozart, path: 'allegro.mp3',  genre: GenreService().classic, mediaType: MediaType.inApp),

  Song(id: 2, title: 'New York State Of Mind - 2pac Feat Nas Jay-Z', artist: ArtistService().tuPac, album: AlbumService().duets, path: 'https://archive.org/download/2pac_-_Tupac_Duets/02%29%20New%20York%20State%20Of%20Mind%20-%202pac%20Feat%20Nas%20%20Jay-Z.mp3', genre: GenreService().rap, mediaType: MediaType.internet),
  Song(id: 3, title: 'Dear Mama part 2', artist: ArtistService().tuPac, album: AlbumService().duets, path: 'https://archive.org/download/2pac_-_Tupac_Duets/14%29%20Dear%20Mama%20Part%20II%20-%202pac%20Feat%20Eminem.mp3', genre: GenreService().rap, mediaType: MediaType.internet),
  Song(id: 4, title: 'I never Change', artist: ArtistService().tuPac, album: AlbumService().duets, path: 'https://archive.org/download/2pac_-_Tupac_Duets/09%29%20I%20Never%20Change%20-%202pac%20Feat%20Jadakiss%20The%20Game%20%20C.mp3', genre: GenreService().rap, mediaType: MediaType.internet),

  Song(id: 5, title: 'Monkey see, Monkey Do', artist: ArtistService().eminem, album: AlbumService().aBeautifulMind, path: 'https://ia904705.us.archive.org/19/items/eminem-straight-from-the-lab_20230107/01.%20Monkey%20See%2C%20Monkey%20Do.mp3', genre: GenreService().rap, mediaType: MediaType.internet),
  Song(id: 6, title: 'We as americans', artist: ArtistService().eminem, album: AlbumService().aBeautifulMind, path: 'https://ia804705.us.archive.org/19/items/eminem-straight-from-the-lab_20230107/02.%20We%20As%20Americans.mp3', genre: GenreService().rap, mediaType: MediaType.internet),
  Song(id: 7, title: 'Love you more', artist: ArtistService().eminem, album: AlbumService().aBeautifulMind, path: 'https://ia904705.us.archive.org/19/items/eminem-straight-from-the-lab_20230107/03.%20Love%20You%20More.mp3', genre: GenreService().rap, mediaType: MediaType.internet),
  Song(id: 8, title: 'Can I Bitch', artist: ArtistService().eminem, album: AlbumService().aBeautifulMind, path: 'https://archive.org/download/eminem-straight-from-the-lab_20230107/04.%20Can%20I%20Bitch.mp3', genre: GenreService().rap, mediaType: MediaType.internet),
  Song(id: 9, title: 'Bully', artist: ArtistService().eminem, album: AlbumService().aBeautifulMind, path: 'https://archive.org/download/eminem-straight-from-the-lab_20230107/05.%20Bully.mp3', genre: GenreService().rap, mediaType: MediaType.internet),
  Song(id: 10, title: '6 in the morning', artist: ArtistService().eminem, album: AlbumService().aBeautifulMind, path: 'https://ia804705.us.archive.org/19/items/eminem-straight-from-the-lab_20230107/06.%206%20in%20the%20Morning%20%28feat.%20D12%29.mp3', genre: GenreService().rap, mediaType: MediaType.internet),

  Song(id: 11, title: 'Rocket', artist: ArtistService().smashingPumpkins, album: AlbumService().liveChicago, path: 'https://archive.org/download/tsp1993-07-26.fm.flacf/01%20-%20Rocket.mp3', genre: GenreService().rock, mediaType: MediaType.internet),
  Song(id: 12, title: 'Cherub Rock', artist: ArtistService().smashingPumpkins, album: AlbumService().liveChicago, path: 'https://archive.org/download/tsp1993-07-26.fm.flacf/02%20-%20Cherub%20Rock.mp3', genre: GenreService().rock, mediaType: MediaType.internet),
  Song(id: 13, title: 'Today', artist: ArtistService().smashingPumpkins, album: AlbumService().liveChicago, path: 'https://archive.org/download/tsp1993-07-26.fm.flacf/03%20-%20Today.mp3', genre: GenreService().rock, mediaType: MediaType.internet),
  Song(id: 14, title: 'Disarm', artist: ArtistService().smashingPumpkins, album: AlbumService().liveChicago, path: 'https://archive.org/download/tsp1993-07-26.fm.flacf/04%20-%20Disarm.mp3', genre: GenreService().rock, mediaType: MediaType.internet),

];