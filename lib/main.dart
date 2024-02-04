import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music/views/new.dart';
import 'package:music/views/songs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      routes: {
        '/songs': (context) => SongScreen(),
      },
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


