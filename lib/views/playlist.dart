import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music/models/playlist_models.dart';
import 'package:music/models/song_model.dart';
import 'package:provider/provider.dart';

class PlayListScreen extends StatelessWidget {
  const PlayListScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
PlaylistProvider playlistProvider = Provider.of<PlaylistProvider>(context);
List<Song> playlist = playlistProvider.playlist;
int? currentSongIndex = playlistProvider.currentSongIndex;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors:[
             Color.fromRGBO(0, 129, 148, 1).withOpacity(0.7),
          Color.fromARGB(255, 234, 197, 224).withOpacity(0.7),
          ]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Text("Playlist",
      style: GoogleFonts.ubuntu(color:Colors.white,fontWeight:FontWeight.bold,fontSize:28),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: ClipRRect(
                  borderRadius:BorderRadius.circular(15) ,
                  
                  child: Image.network(
                    width: 350,
                    'https://i.ytimg.com/vi/Wb9igtNa80I/maxresdefault.jpg',
                  height: 250,
                  fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Text(playlist[0].title,style: GoogleFonts.ubuntu(color:Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 26),),
              const SizedBox(height: 30,),
              PlayOrShuffleSwitch(),
              SizedBox(height: 20,),
              ListView.builder(
                itemCount: playlist.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context , index) {
                  return ListTile(
                    leading: Text('${index + 1}',
                    style: GoogleFonts.ubuntu(color:Colors.white,
                    fontSize:24),),
                    title: Text(playlist[index].title,
                    style: GoogleFonts.ubuntu(color:Colors.white,
                    fontSize:24),),
                    subtitle: Text(playlist[index].description,
                    style: GoogleFonts.ubuntu(color:Colors.white,
                    fontSize:16),),
                    trailing: Icon(Icons.more_vert,
                    color: Colors.white,),
                  );
                })
            ]
                ),
        ),
            )
          
        ),
      ); 

    
  }
}

class PlayOrShuffleSwitch extends StatefulWidget {
  const PlayOrShuffleSwitch({
    super.key,
  });

  @override
  State<PlayOrShuffleSwitch> createState() => _PlayOrShuffleSwitchState();
}

class _PlayOrShuffleSwitchState extends State<PlayOrShuffleSwitch> {
  bool isPlay = true;
 
  @override
  Widget build(BuildContext context) {
     double width = MediaQuery.of(context).size.width;
     return GestureDetector(
      onTap: (() {
        
        setState(() {
          isPlay = !isPlay;
        });
      }),
       child: Container(
        height: 50,
        width: width ,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: Duration(milliseconds: 200),
              left: isPlay ? 0: width*0.45,
              child: Container(
                      height: 50,
                      width: width*0.45,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(0, 129, 148, 1).withOpacity(0.7),
                        borderRadius: BorderRadius.circular(15)
                      ),),
            ),
            Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text('Play',
                      style: GoogleFonts.ubuntu(
                        color:isPlay?  Colors.white:Color.fromRGBO(0, 47, 54, 1),
                        fontSize: 17
                      ),),
                    ),
                    const SizedBox(width: 10,),
                    Icon(
                      Icons.play_circle,
                      color: isPlay ? Colors.white:Color.fromRGBO(0, 47, 54, 1),
                    )
                
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text('Shuffle',
                      style: GoogleFonts.ubuntu(
                        color:isPlay? Color.fromRGBO(0, 47, 54, 1):Colors.white,
                        fontSize: 17
                      ),),
                    ),
                    const SizedBox(width: 10,),
                    Icon(
                      Icons.shuffle_outlined,
                      color: isPlay ?Color.fromRGBO(0, 47, 54, 1):Colors.white,
                    )
                  ],
                ),
              )
            ],
          ),]
        ),
           ),
     );
  }
}