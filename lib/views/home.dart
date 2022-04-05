import 'package:flutter/material.dart';
import 'package:flutter_wallpaper/data/data.dart';
import 'package:flutter_wallpaper/model/categories_model.dart';
import 'package:flutter_wallpaper/widgets/widget.dart';

class Home extends StatefulWidget {


  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<CategorieModel> categories = [];

  @override
  void initState(){
    super.initState();
    categories = getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: brandName(),
        elevation: 0.0,
      ),
      body: Container(
        child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Color(0xfff5f8fd),
              borderRadius:  BorderRadius.circular(30),
            ),
            padding: EdgeInsets.symmetric(horizontal: 24),
            margin: EdgeInsets.symmetric(horizontal: 24),
            child: Row(children: <Widget>[
              Expanded(
              child: TextField(
                
                decoration: InputDecoration(
                  hintText : "search wallpaper",
                  border: InputBorder.none,
                ),
              ),
              ),
              Icon(Icons.search)
            ],),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
              height: 80,
              child: ListView.builder(
                  itemCount: categories.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CategoriesTile(
                      title: categories[index].categorieName.toString(),
                      imgUrl: categories[index].imgUrl.toString(),
                    );
                  }),
            ),
        ],
      ),),
    );
  }
}
class CategoriesTile extends StatelessWidget {
  final String imgUrl, title;
  CategoriesTile({required this.imgUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(children: <Widget>[
        Container(
          child: Image.network(imgUrl),
        ),
        Container(child: Text(title),)
      ],),
    );
  }
}