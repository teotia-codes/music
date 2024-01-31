

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:music/controller/player_controller.dart';
import 'package:on_audio_query/on_audio_query.dart';
class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
var controller = Get.put(PlayerController());
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.format_align_center_rounded, size: 30),
        title: Text(
          'Beats',
          style: GoogleFonts.oswald(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ))
        ],
      ),
      body: FutureBuilder<List<SongModel>>(future: controller.audioQuery.querySongs(ignoreCase: true,
      orderType: OrderType.ASC_OR_SMALLER,
      sortType: null,
      uriType: UriType.EXTERNAL,), builder: (context, snapshot) {
        if(snapshot.data == null ) {
          return CircularProgressIndicator();
        } else if(snapshot.data!.isEmpty) {
          return Center(child: Text('No song found',style: GoogleFonts.oswald(),),);
        } else {
          return Padding(padding: EdgeInsets.all(8),
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
            itemCount: 100,
            itemBuilder: ((context, index) {
              return Container(
             margin: EdgeInsets.only(bottom: 4),
                child: ListTile(
                  title: Text(
                    'Music name',
                    style: GoogleFonts.mukta(
                        fontWeight: FontWeight.w700, fontSize: 19),
                  ),
                  subtitle: Text('Artist name',
                      style: GoogleFonts.mukta(fontWeight: FontWeight.w500)),
                  leading: Icon(Icons.music_note),
                  trailing: Icon(Icons.play_arrow_sharp),
                ),
              );
            })),
      );
        }

      },)
    );
  }
}
