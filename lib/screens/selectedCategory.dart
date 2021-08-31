import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newflut_app/services/services.dart';
import 'package:newflut_app/helper/buildCategories.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:newflut_app/constants.dart';

class SelectedCategory extends StatefulWidget {
  @override
  _SelectedCategoryState createState() => _SelectedCategoryState();
}

final List<String> imgList = [
  // path to images used in the image carousel
  'images/c1.jpg',
  'images/m1.jpeg',
  'images/w1.jpeg',
  'images/w3.jpeg',
];

CarouselController _customCarouselController =
    CarouselController(); // controller for the image carousel

class _SelectedCategoryState extends State<SelectedCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: SafeArea(
        child: Drawer(
          child: FutureBuilder(
            future: fetchCategories(
                '$SERVER_URL/get_category'),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Expanded(
                  child: Row(
                      children: <Widget>[
                        Center(child: CircularProgressIndicator()),
                        Text('Loading...'),
                      ],
                  ),
                );
              } else {
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(snapshot.data[index].label),
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder(
              future: fetchCategories('$SERVER_URL/get_subcategories'),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return Center(
                    child: Row(
                      children: <Widget>[
                        CircularProgressIndicator(),
                        Text('Loading...'),
                      ],
                    ),
                  );
                } else {
                  if (snapshot.data.length == 0) {
                    return Text('Check your network');
                  } else {
                    return buildCategories(snapshot, '/SelectedCategory', context);
                  }
                }
              },
            ),
            Divider(),
            Container(
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 0.2,
              child: Container(
                child: CarouselSlider(
                  options: CarouselOptions(
                    aspectRatio: 16 / 9,
                    initialPage: 0,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(seconds: 2),
                    scrollDirection: Axis.horizontal,
                    enableInfiniteScroll: true,
                  ),
                  items: imgList
                      .map((item) => Container(
                              child: Center(
                            child: Image.asset(
                              item,
                              fit: BoxFit.cover,
                            ),
                          )))
                      .toList(),
                  carouselController: _customCarouselController,
                ),
              ),
            ),
            Divider(),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              margin: EdgeInsets.fromLTRB(20, 20.0, 0, 0),
              child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    fillColor: bgColor,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    suffixIcon: Icon(
                      Icons.search,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(BorderRadiusValue),
                      borderSide: BorderSide(
                        color: PColor,
                        width: TextFieldBorderWidth,
                      ),
                    ),
                    labelText: 'Search',
                    hintText: 'How can we help ?',
                  )),
            ),
            Divider(),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                children: List.generate(15, (index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/SelectedShop');
                    },
                    child: Container(
                      margin: EdgeInsets.all(3.0),
                      color: PColor,
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
