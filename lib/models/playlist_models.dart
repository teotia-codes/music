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
Duration _totalDuration = Duration.zero;

PlaylistProvider(){
  listenToDuration();
}
bool _isPlaying = false;

void play()async {
  final String path = _playlist[_currentSongIndex!].url;
  await _audioPlayer.stop();
  await _audioPlayer.play(AssetSource(path));
  _isPlaying = true; 
  notifyListeners();
}
void pause() async {
  await _audioPlayer.pause();
  _isPlaying = false;
  notifyListeners();
}
void resume () async {
  await _audioPlayer.resume();
  _isPlaying = true; 
  notifyListeners();
}

void pauseOrResume () async {
  if(_isPlaying){
    pause();
  } else{
    play();
  }
  notifyListeners();
}
void seek(Duration position) async {
  await _audioPlayer.seek(position);
}

void playNextSong()  {
if(_currentSongIndex != null) {
 if(_currentSongIndex!<_playlist.length -1) {
   currentSongIndex = _currentSongIndex! +1;
 } else {
  currentSongIndex = 0;
 }

}
}
void playPreviousSong() async {
  if(_currentDuration.inSeconds > 2){
seek(Duration.zero);
  }else {
    if(_currentSongIndex! > 0){
      currentSongIndex =_currentSongIndex! - 1;
    }else {
      currentSongIndex =_playlist.length - 1 ;
    }
  }
}
void listenToDuration() {
_audioPlayer.onDurationChanged.listen((newDuration) {
  _totalDuration = newDuration;
  notifyListeners();
});

_audioPlayer.onPositionChanged.listen((newPosition) {
  _currentDuration = newPosition;
  notifyListeners();
});
_audioPlayer.onPlayerComplete.listen((event) { 
playNextSong();
});
}
  List <Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;
bool get isPlaying => _isPlaying;
Duration get  currentDuration => _currentDuration;
Duration get totalDuration => _totalDuration;

 set currentSongIndex(int? newIndex){
  _currentSongIndex = newIndex;
  if(newIndex != null){
    play();
  }
  notifyListeners();
 }
}