import 'package:music/models/song_model.dart';

class Playlist {
  final String title;
  final List<Song> songs;
  final String imageurl;

Playlist({
  required this.title,
  required this.songs,
  required this.imageurl
});
static List<Playlist> playlists = [
  Playlist(title: 'Bachke Bachke',
  songs: Song.songs,
  imageurl:'assets/images/1.jpeg'),
    Playlist(title: 'Pee loon',
  songs: Song.songs,
  imageurl: 'assets/images/2.jpeg'),
  Playlist(title: 'Tere Hawale',
  songs: Song.songs,
  imageurl: 'assets/images/3.jpeg'),
];
}