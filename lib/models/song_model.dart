class Song {
  final String title;
  final String description;
  final String url;
  final String coverUrl;
  final String backgroundimg;
  final int id;
Song({
  required this.id,
  required this.title,
  required this.description,
  required this.url,
  required this.coverUrl,
  required this.backgroundimg
});

static List<Song> songs = [
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

}
