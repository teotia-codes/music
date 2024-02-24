import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music/models/playlist_models.dart';
import 'package:music/views/new.dart';
import 'package:music/views/playlist.dart';
import 'package:music/views/songs.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: ((context) => PlaylistProvider()))],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
   
      title: 'Music',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:New() ,
    );
  }
}


