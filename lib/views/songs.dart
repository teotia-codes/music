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



  Stream<SeekBarData> get _seekBarDataStream =>
      rxdart.CombineLatestStream.combine2(
        audioPlayer.positionStream,
        audioPlayer.durationStream,
        (Duration position, Duration? duration) {
          return SeekBarData(position, duration ?? Duration.zero);
        },
      );

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
                  SizedBox(
                    height: 20,
                  ),
                  StreamBuilder<SeekBarData>(
                      stream: _seekBarDataStream,
                      builder: (context, snapshot) {
                        final positionData = snapshot.data;
                        return SeekBar(
                          position: positionData?.position ?? Duration.zero,
                          duration: positionData?.duration ?? Duration.zero,
                          onChangeEnd: audioPlayer.seek,
                        );
                      }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          child: GestureDetector(
                        onTap: () {},
                        child: Icon(
                          Icons.skip_previous_outlined,
                          size: 45,
                          color: Colors.white,
                        ),
                      )),
                     
                      Expanded(
                          child: GestureDetector(
                        onTap: () {},
                        child: Icon(Icons.play_arrow,
                        size: 45,
                          color: Colors.white,),
                      )),
                      
                      Expanded(
                          child: GestureDetector(
                        onTap: () {},
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
