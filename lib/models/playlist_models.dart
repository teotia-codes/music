import 'package:flutter/material.dart';

import 'package:music/models/song_model.dart';
import 'package:audioplayers/audioplayers.dart';
class PlaylistProvider extends ChangeNotifier {
  final List<Song> _playlist = [
    Song(id: 1,
    title: 'Bachke Bachke',
  description: 'Punjabi',
  url: 'assets/music/aujla.mp3',
  coverUrl: 'assets/images/1.jpeg',
  backgroundimg: 'assets/images/auj.jpg'),
  Song(id: 2,
    title: 'Pee loon',
  description: 'Romantic',
  url: 'assets/music/kk.mp3',
  coverUrl: 'assets/images/2.jpeg',
  backgroundimg: 'assets/images/kk.jpg'
  ),
  Song(
    id:3,
    title: 'Tere Hawale',
  description: 'Bollywood',
  url: 'assets/music/arijit.mp3',
  coverUrl: 'assets/images/3.jpeg',
  backgroundimg: 'assets/images/arjit.jpg'),
  ];
  int? _currentSongIndex;
final AudioPlayer _audioPlayer = AudioPlayer();

Duration _currentDuration = Duration.zero;
Duration _TotalDuration = Duration.zero;

PlaylistProvider(){
  listenToDuration();
}
bool _isPlaying = false;

void play()async {
final String path = _playlist[_currentSongIndex!].;
}
void listenToDuration() {
_audioPlayer.onDurationChanged.listen((newDuration) {
  _TotalDuration = newDuration;
  notifyListeners();
});

_audioPlayer.onPositionChanged.listen((newPosition) {
  _currentDuration = newPosition;
  notifyListeners();
});
_audioPlayer.onPlayerComplete.listen((newPosition) { 

});
}
  List <Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;
 set currentSongIndex(int? newIndex){

  _currentSongIndex = newIndex;
  notifyListeners();
 }
}