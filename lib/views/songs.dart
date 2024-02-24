import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music/models/song_model.dart';

import 'package:music/widgets/seekbar.dart';
import 'package:rxdart/rxdart.dart' as rxdart;

class SongScreen extends StatefulWidget {
  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  AudioPlayer audioPlayer = AudioPlayer();
  late Song song;
 
void _updateAudioSource() {
  audioPlayer.setAudioSource(
    ConcatenatingAudioSource(
      children: Song.songs.map((song) {
        return AudioSource.uri(
          Uri.parse('asset:///${song.url}'),
        );
      }).toList(),
    ),
  );
}

void _onSongChanged() {
  _updateAudioSource();
}
  @override
  void initState() {
    super.initState();
    song = Get.arguments ?? Song.songs[0];
    _updateAudioSource();
  }

@override
void dispose(){
  audioPlayer.dispose();
  super.dispose();
}


 

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            song.backgroundimg,
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
                Text(song.title,
                style: GoogleFonts.ubuntu(
                  color:Colors.white,
                  fontSize:36,
                  fontWeight: FontWeight.bold,

                ),),
               SizedBox(height: 5,),
                Text(song.description,
                maxLines: 2,
                
                style: GoogleFonts.ubuntu(color:Colors.white,
                fontSize:16,
                fontWeight:FontWeight.w400),),
                SizedBox(height: 20,),
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
        StreamBuilder<SequenceState?>(
            stream: audioPlayer.sequenceStateStream,
            builder: (context, index) {
              return IconButton(
                 onPressed: () {
        if (audioPlayer.hasPrevious) {
          audioPlayer.seekToPrevious();
          int previousIndex = (song.id - 1) % Song.songs.length;
          if (previousIndex < 0) {
            previousIndex = Song.songs.length - 1; // Wrap around to the last song
          }
          setState(() {
            song = Song.songs[previousIndex];
          });
          _onSongChanged(); // Update the audio source
        }
      },

                icon: Icon(Icons.skip_previous_outlined, color: Colors.white),
                iconSize: 45,
              );
            }),
        StreamBuilder<PlayerState>(
            stream: audioPlayer.playerStateStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final playerState = snapshot.data;
                final processingState = playerState!.processingState;
                if (processingState == ProcessingState.loading ||
                    processingState == ProcessingState.buffering) {
                  return Container(
                    width: 64,
                    height: 64,
                    margin: EdgeInsets.all(10),
                    child: CircularProgressIndicator(),
                  );
                } else if (!audioPlayer.playing) {
                  return IconButton(
                    iconSize: 75,
                    onPressed: audioPlayer.play,
                    icon: Icon(
                      Icons.play_circle,
                      color: Colors.white,
                    ),
                  );
                } else if (processingState != ProcessingState.completed) {
                  return IconButton(
                      iconSize: 75,
                      onPressed: audioPlayer.pause,
                      icon: Icon(
                        Icons.pause_circle_filled,
                        color: Colors.white,
                      ));
                } else {
                  return IconButton(
                    iconSize: 75,
                    color: Colors.white,
                    onPressed: () => audioPlayer.seek(Duration.zero,
                        index: audioPlayer.effectiveIndices!.first),
                    icon: Icon(Icons.replay_circle_filled_outlined),
                  );
                }
              } else {
                return CircularProgressIndicator();
              }
            }),
        StreamBuilder<SequenceState?>(
            stream: audioPlayer.sequenceStateStream,
            builder: (context, index) {
              return IconButton(
                onPressed:(){  if (audioPlayer.hasNext) {
    audioPlayer.seekToNext();
    setState(() {
      // Update the song when pressing the forward button
      song = Song.songs[(song.id +1) % Song.songs.length];
    });
     
                }},
                icon: Icon(Icons.skip_next_outlined, color: Colors.white),
                iconSize: 45,
              );
            }),
      ],
    ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

