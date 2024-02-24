import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music/models/playlist_models.dart';
import 'package:music/models/song_model.dart';
import 'package:music/views/playlist.dart';
import 'package:music/views/songs.dart';
import 'package:music/widgets/audio_header.dart';
import 'package:music/widgets/song_card.dart';
import 'package:provider/provider.dart';

class New extends StatefulWidget {
  New({super.key});
  @override
  State<StatefulWidget> createState() {
    return _New();
  }
}

class _New extends State<New> {
  late final dynamic playlistProvider;
  @override
  void initState() {

    super.initState();
 playlistProvider = Provider.of<PlaylistProvider>(context, listen: false);
  }
  void goToSong(int songIndex) {
playlistProvider.currentSongIndex = songIndex;

Navigator.of(context).push(MaterialPageRoute(builder: (context) =>SongScreen()));
  }
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
        body: Consumer<PlaylistProvider>(
          builder: ( (context, value, child) {
            final List<Song>playlist = value.playlist;
            return  SingleChildScrollView(
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
                            itemCount: playlist.length,
                            
                            itemBuilder: (context, index) {
                              final Song song = playlist[index];
                              return InkWell(
      onTap:(){
      goToSong(index);
      } ,
      child: Container(
        height: 600,
        margin: EdgeInsets.only(right: 10),
        child: Stack(alignment: Alignment.bottomCenter, children: [
          Container(
            width: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                  image: AssetImage(song.coverUrl), fit: BoxFit.cover),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            height: 60,
            width: MediaQuery.of(context).size.height * 0.4,
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white.withOpacity(0.4),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 50,),
                Column(
                children: [
                  Text(
                    song.title,
                    style: GoogleFonts.ubuntu(
                       color: Color.fromRGBO(1, 54, 62, 1),
                        fontWeight: FontWeight.w500, fontSize: 18),
                      
                  ),
                  Text(
                    song.description,
                    style: GoogleFonts.ubuntu(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Color.fromRGBO(1, 54, 62, 1)
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 30),
            const Icon(Icons.play_circle,size: 36,color:  Color.fromRGBO(0, 72, 83, 1),)
              ],
            ),
          )
        ],),
      ),
    );
                            }),
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
                        physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                       
                          itemCount: playlist.length,
                          itemBuilder: (ctx, index) {
                            return InkWell(
            onTap:() => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PlayListScreen(),),),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12)
                                 ),
                                padding: EdgeInsets.symmetric(horizontal: 6,vertical: 3),
                                margin: EdgeInsets.only(bottom: 8),
                                                      
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        playlist[index].coverUrl,
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
                                            '${playlist.length} songs',
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
                              ),
                            );
                          })
                    ],
                  ),
                )
              ],
            ),
          );
          })
          
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
