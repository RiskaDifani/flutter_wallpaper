import 'package:flutter/material.dart';
import 'package:flutter_wallpaper/views/home.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WallpaperHub',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor : Colors.white,
      ),
      home: HomePage(),
    );
  }
}


