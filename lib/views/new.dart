import 'package:flutter/material.dart';

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
      appBar: PreferredSize(preferredSize: Size.fromHeight(20), child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.grid_view_rounded,color: Colors.white,),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20),
            child: CircleAvatar(
              backgroundImage: ,
            ),
          )
        ],
      )),
      body: Container(),),
    );
  }}
