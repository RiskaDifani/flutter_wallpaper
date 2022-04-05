import 'package:flutter/material.dart';
import 'package:flutter_wallpaper/widgets/widget.dart';
class Home extends StatefulWidget {


  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: brandName(),
        elevation: 0.0,
      ),
      body: Container(child: Column(
        children: <Widget>[
          Container(
            
            child: Row(children: <Widget>[
              Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText : "search"
                ),
              ),
              ),
              Icon(Icons.search)
            ],),
          )
        ],
      ),),
    );
  }
}