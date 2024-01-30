import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.align_horizontal_right_sharp, size: 36),
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
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
          itemCount: 100,
          itemBuilder: ((context, index) {
            return Container(
           margin: EdgeInsets.only(bottom: 8),
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
}
