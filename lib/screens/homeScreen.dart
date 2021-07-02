import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:newflut_app/helper/mainNavigation.dart';
import 'package:newflut_app/menuOptionEnum.dart';
import 'package:newflut_app/services/services.dart';

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
          Container(
            color: Colors.blueGrey,
            width: 80.0,
            height: 80.0,
            margin: EdgeInsets.all(10.0),
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
                child: Container(
                  child: CarouselSlider(
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
                                fit: BoxFit.cover,
                              ),
                            )))
                        .toList(),
                    carouselController: _customCarouselController,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () => _customCarouselController.nextPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.linear,
                ),
                child: Text('→'),
              ),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Search',

                          hintText: 'How can we help ?',
                        )),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.search,
                    ),
                    onPressed: () {
                      print('Hello');
                    },
                  )
                ],
              ),
              Divider(
                color: Colors.grey,
              ),
              Text(
                'Recents',
                style: TextStyle(
                  color: Colors.grey,
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
                color: Colors.grey,
              ),
              Text(
                  'Categories',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 30.0,
                  )
              ),
              FutureBuilder(
                future: fetchCategories(),
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
                    return SizedBox(
                      height: 120.0,
                      child: ListView.builder(
                        itemCount: snapshot.data.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext, int index) {
                          return Column(
                            children: <Widget> [
                              Container(
                                width: 80.0,
                                height: 80.0,
                                margin: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                 shape: BoxShape.circle,
                                  color: Colors.blueGrey,
                                ),
                              ),
                              Align(
                                child: Text(snapshot.data[index].label),
                                alignment: Alignment.center,
                              ),
                            ]
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ]),
      bottomNavigationBar: MainBottomNavigationBar(selectedMenu: MenuState.home,),
    );
  }
}
