import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class New extends StatefulWidget {
  New({super.key});
  @override
  State<StatefulWidget> createState() {
  return _New();
  }
}
class _New extends State<New> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: LinearGradient(colors: [Color.fromRGBO(255, 85, 212, 1).withOpacity(0.7),
      Color.fromARGB(255, 255, 233, 249).withOpacity(0.7),],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter),
      ),
      child: Scaffold(backgroundColor: Colors.transparent,
      appBar: PreferredSize(preferredSize: Size.fromHeight(30), child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.grid_view_rounded,color: Colors.white,),
        actions: [
          Icon(Icons.account_circle_outlined,color: Colors.white,
          size: 24,
          ),
          SizedBox(width: 18,)
        ],
      ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.white,
      items: const [BottomNavigationBarItem(
        icon:Icon(Icons.home_outlined), label: 'Home' ),
      BottomNavigationBarItem(icon:Icon(Icons.star_border), label: 'Favourite' ),
      BottomNavigationBarItem(icon:Icon(Icons.play_circle), label: 'Play' ),
      BottomNavigationBarItem(icon:Icon(Icons.people_alt_outlined), label: 'Profile' ),],backgroundColor:  Color.fromARGB(255, 168, 46, 135)),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children:[ Text('Welcome',style: GoogleFonts.ubuntu(color: Colors.white,fontWeight: FontWeight.bold,
              fontSize: 24),),
              SizedBox(height: 5,),
              Text('Enjoy your favourite music',style: GoogleFonts.ubuntu(color: Colors.white,fontWeight: FontWeight.bold,
              fontSize: 24),),]
            ),
          )
        ],),
      ),),
    );
  }}
