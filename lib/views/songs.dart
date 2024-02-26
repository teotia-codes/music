import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music/models/playlist_models.dart';
import 'package:music/models/song_model.dart';

import 'package:music/widgets/seekbar.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart' as rxdart;



class SongScreen extends StatelessWidget {
  AudioPlayer audioPlayer = AudioPlayer();

String formatTime(Duration duration) {
  String twoDigitSeconds = duration.inSeconds.remainder(60).toString().padLeft(2,'0');
  String formattedTime = "${duration.inMinutes}:${twoDigitSeconds}";
  return formattedTime;
}

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(
      builder: ( context,  value, child) {
        final playlist = value.playlist;
        final currentSong = playlist[value.currentSongIndex ?? 0];
       return  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.white,
        ),
        extendBodyBehindAppBar: true,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
           currentSong.backgroundimg  ,
              fit: BoxFit.cover,
            ),
            ShaderMask(
              blendMode: BlendMode.dstOut,
              shaderCallback: (rect) {
                return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white,
                    Colors.white.withOpacity(0.0),
                    Colors.white.withOpacity(0.0)
                  ],
                  stops: [0.0, 0.4, 0.6],
                ).createShader(rect);
              },
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(0, 116, 134, 1).withOpacity(0.5),
                      Color.fromARGB(255, 145, 0, 104).withOpacity(0.7),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    currentSong.title,
                    style: GoogleFonts.ubuntu(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                   currentSong.description,
                    maxLines: 2,
                    style: GoogleFonts.ubuntu(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Text(formatTime(value.currentDuration),style: TextStyle(color: Colors.white,fontSize: 18),),
                    Text(formatTime(value.totalDuration),style: TextStyle(color: Colors.white,fontSize: 18),),
                  ],),
                  SizedBox(
                    height: 20,
                  ),
                 SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 11)
                  ),
                   child: Slider(  min: 0,
                     max: value.totalDuration.inSeconds.toDouble(),
                    value:value.currentDuration.inSeconds.toDouble(),
                   
                   activeColor: Color.fromARGB(255, 255, 0, 0),
                    onChanged: (double double){
                   
                    },
                    onChangeEnd: (double double ){
                   value.seek(Duration(seconds: double.toInt()));
                    },),
                 ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          
                          child: GestureDetector(
                            
                        onTap:  value.playPreviousSong,
                      
                        child: Icon(
                          Icons.skip_previous_outlined,
                          size: 45,
                          color: Colors.white,
                        ),
                      )),
                     
                      Expanded(
                        flex: 0,
                          child: GestureDetector(
                        onTap:  value.pauseOrResume,
                       
                        child: Icon(value.isPlaying?Icons.pause_circle:Icons.play_arrow,
                        size: 60,
                          color: Colors.white,),
                      )),
                      
                      Expanded(
                          child: GestureDetector(
                        onTap: value.playNextSong,
                       
                        child: Icon(Icons.skip_next_outlined,
                        size: 45,
                          color: Colors.white,),
                      ))
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      );
        },
     
    );
  }
}
