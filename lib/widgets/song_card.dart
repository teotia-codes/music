import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music/models/song_model.dart';
import 'package:music/views/songs.dart';

class SongCard extends StatelessWidget {
  const SongCard({
    super.key,
    required this.song,
   
  });

  final Song song;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){
        Navigator.of(context).push(MaterialPageRoute(builder: ((context) => SongScreen())));
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
  }
}
