import 'package:flutter/material.dart';
import 'package:flutter_wallpaper/model/wallpaper_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_wallpaper/widgets/widget.dart';
import 'dart:convert';
import 'package:flutter_wallpaper/data/data.dart';
class Categorie extends StatefulWidget {
  final String categorieName;
  Categorie({required this.categorieName});
  @override
  State<Categorie> createState() => _CategorieState();
}

class _CategorieState extends State<Categorie> {
  List<WallpaperModel> wallpapers = [];

  getSearchWallpapers() async{
    var response = await http.get(Uri.parse("https://api.pexels.com/v1/search?query=${widget.categorieName}&per_page=15&page=1"), 
    headers: {"Authorization": apiKEY});

    // print(response.body.toString());

    Map<String,dynamic> jsonData = jsonDecode(response.body);
    jsonData["photos"].forEach((element){
      // print(element);
      WallpaperModel wallpaperModel = new WallpaperModel();
      wallpaperModel = WallpaperModel.fromMap(element);
      wallpapers.add(wallpaperModel);
    });

    setState(() {
      
    });
  }
  
  @override
  void initState() {
    getSearchWallpapers();
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: brandName(),
          elevation: 0.0,
          actions: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            )
          ],
        ),
      body: SingleChildScrollView(
        child: Container(
            child: WallpapersList(wallpapers: wallpapers ,context: context)
        ),
      )
    );
  }
}