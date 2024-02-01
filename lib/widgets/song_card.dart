import 'package:flutter/material.dart';
import 'package:music/models/song_model.dart';

class SongCard extends StatelessWidget {
  const SongCard({
    super.key,
    required this.song,
  });

  final Song song;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: Stack(
        alignment:Alignment.bottomCenter ,
        children: [Container(width: MediaQuery.of(context).size.height *0.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(image: AssetImage(song.coverUrl),fit: BoxFit.cover),
              ),
        ),
        Container(
          
          height: 50,
          width: MediaQuery.of(context).size.height *0.4,
        margin: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
           color: Colors.white.withOpacity(0.5)
              ),
        )]
      ),
    );
  }
}