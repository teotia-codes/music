import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music/models/song_model.dart';
import 'package:music/widgets/seekbar.dart';
import 'package:rxdart/rxdart.dart' as rxdart;

class SongScreen extends StatefulWidget {
  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  late AudioPlayer audioPlayer;
  late Song song;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    song = Song.songs[0];
    _initializeAudioPlayer();
  }

  void _initializeAudioPlayer() async {
    await audioPlayer.setAudioSource(
      ConcatenatingAudioSource(
        children: [
          AudioSource.uri(
            Uri.parse('asset:///${song.url}'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
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
          StreamBuilder<SeekBarData>(stream: _seekBarDataStream, builder:(context , snapshot) {
            final positionData = snapshot.data;
            return SeekBar(position: positionData?.duration ?? Duration.zero, duration:positionData?.duration ?? Duration.zero,
            onChangeEnd:audioPlayer.seek ,
);
          } )
        ],
      ),
    );
  }
}
