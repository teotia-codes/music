import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music/models/playlist_models.dart';
import 'package:music/models/song_model.dart';
import 'package:music/widgets/audio_header.dart';
import 'package:music/widgets/song_card.dart';

class New extends StatefulWidget {
  New({super.key});
  @override
  State<StatefulWidget> createState() {
    return _New();
  }
}

class _New extends State<New> {
  List<Song> songs = Song.songs;
  List<Playlist> playlist = Playlist.playlists;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromRGBO(0, 129, 148, 1).withOpacity(0.7),
          Color.fromARGB(255, 234, 197, 224).withOpacity(0.7),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(30),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: const Icon(
              Icons.grid_view_rounded,
              color: Colors.white,
            ),
            actions: [
              Icon(
                Icons.account_circle_outlined,
                color: Colors.white,
                size: 30,
              ),
              SizedBox(
                width: 18,
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Colors.white,
            selectedItemColor: Colors.white,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.star_border), label: 'Favourite'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.play_circle), label: 'Play'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.people_alt_outlined), label: 'Profile'),
            ],
            backgroundColor: Color.fromRGBO(0, 111, 128, 1)),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _DiscoverMusic(),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: Column(
                  children: [
                    SectionHeader(title: 'Trending Music',width: 100,),
                    const SizedBox(
                      height: 14,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.27,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: songs.length,
                          itemBuilder: ((context, index) {
                            return SongCard(song: songs[index]);
                          })),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(

                 
                  children: [
                 const  SectionHeader(title: 'Playlist',width: 180,),
                   const SizedBox(height: 10,),
                    ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: playlist.length,
                        itemBuilder: (ctx, index) {
                          return Container(
                            padding: EdgeInsets.only(bottom: 3),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    playlist[index].imageurl,
                                    fit: BoxFit.cover,
                                    height: 80,
                                    width: 60,
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Expanded(
                                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        playlist[index].title,
                                        style: GoogleFonts.ubuntu(
                                            fontSize: 20, color: Colors.white,fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '${playlist[index].songs.length} songs',
                                        style: GoogleFonts.ubuntu(
                                            fontSize: 18, color: Colors.white,),
                                      )
                                    ],
                                  ),
                                ),
                                IconButton(onPressed: () {}, icon: Icon(Icons.play_circle_fill,
                                size: 36,
                                color: Colors.white,))
                              ],
                            ),
                          );
                        })
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _DiscoverMusic extends StatelessWidget {
  const _DiscoverMusic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Welcome',
          style: GoogleFonts.ubuntu(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SizedBox(
          height: 2,
        ),
        Text(
          'Enjoy your favourite music',
          style: GoogleFonts.ubuntu(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          decoration: InputDecoration(
            isDense: true,
            filled: true,
            fillColor: Colors.white,
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.grey.shade400),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey.shade400,
            ),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(18)),
          ),
        )
      ]),
    );
  }
}
