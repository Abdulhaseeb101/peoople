import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:newflut_app/helper/buildCategories.dart';
import 'package:newflut_app/helper/mainNavigation.dart';
import 'package:newflut_app/menuOptionEnum.dart';
import 'package:newflut_app/services/services.dart';
import 'package:newflut_app/constants.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Widget> _drawContainers() {
    // This function draws containers for the home page recents

    List<Widget> containers = [];
    const int recentsCount = 10;  // number of recents

    for(int i = 0; i <= recentsCount; i++) {
      containers.add(
          GestureDetector(
            onTap: () {},
            child: Container(
              color: Colors.blueGrey,
              width: 80.0,
              height: 80.0,
              margin: EdgeInsets.all(10.0),
            ),
          )
      );
    }
    return containers;
  }

  final List<String> imgList = [  // path to images used in the image carousel
    'images/c1.jpg',
    'images/m1.jpeg',
    'images/w1.jpeg',
    'images/w3.jpeg',
  ];

  CarouselController _customCarouselController = CarouselController();  // controller for the image carousel

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 0.2,
                  child:CarouselSlider(
                    options: CarouselOptions(
                      aspectRatio: 16/9,
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
                                scale: 0.10,
                              ),
                            )))
                        .toList(),
                    carouselController: _customCarouselController,
                  ),
              ),
              Row(
                children: [
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
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 20.0, 0, 0),
                    child: IconButton(
                      color: STextColor,
                      icon: Icon(
                        Icons.search,
                      ),
                      onPressed: () {
                        print('Hello');
                      },
                    ),
                  )
                ],
              ),
              Divider(
                color: STextColor,
              ),
              Text(
                'Recents',
                style: TextStyle(
                  color: PTextColor,
                  fontSize: 30.0,
                )
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _drawContainers(),
                ),
              ),
              Divider(
                color: STextColor,
              ),
              Text(
                  'Categories',
                  style: TextStyle(
                    color: PTextColor,
                    fontSize: 30.0,
                  )
              ),
              FutureBuilder(
                future: fetchCategories('$SERVER_URL/get_category'),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if(snapshot.data == null) {
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
                      return Text(
                        'Check your network',
                      );
                    } else {
                      return buildCategories(snapshot, '/SelectedCategory', context);
                    }
                  }
                },
              ),
            ]),
      bottomNavigationBar: MainBottomNavigationBar(selectedMenu: MenuState.home,),
    );
  }
}
