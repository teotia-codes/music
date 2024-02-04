class Song {
  final String title;
  final String description;
  final String url;
  final String coverUrl;
Song({
  required this.title,
  required this.description,
  required this.url,
  required this.coverUrl,
});

static List<Song> songs = [
  Song(title: 'Bachke Bachke',
  description: 'Punjabi',
  url: 'assets/music/aujla.mp3',
  coverUrl: 'assets/images/1.jpeg'),
  Song(title: 'Pee loon',
  description: 'Romantic',
  url: 'assets/music/kk.mp3',
  coverUrl: 'assets/images/2.jpeg'),
  Song(title: 'Tere Hawale',
  description: 'Bollywood',
  url: 'assets/music/arijit.mp3',
  coverUrl: 'assets/images/3.jpeg'),
  
];
}
