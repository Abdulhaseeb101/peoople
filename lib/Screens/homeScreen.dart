import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Account'
    ),
    Text(
        'Index 1: Home'
    ),
    Text(
        'Index 2: Cart'
    ),
  ];

  void _onItemTapped(int index) {
    setState(
        () {
          _selectedIndex = index;
        }
    );
  }

  final List<String> imgList = [
    'images/c1.jpg',
    'images/m1.jpeg',
    'images/w1.jpeg',
    'images/w3.jpeg',
  ];

  CarouselController _customCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Image.asset(
            'Assets/pngfind.com-aai-png-3728789.png',
            fit: BoxFit.cover,
            width: 100,
          ),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.fromLTRB(0, 12, 10, 0),
                child: RichText(
                    text: TextSpan(
                        text: 'Adirampattinam',
                        recognizer: new TapGestureRecognizer()
                          ..onTap = () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    height: 2800.0,
                                    child: Align(
                                      child: Container(
                                        child: Text(
                                          'Map Here!',
                                          style: TextStyle(
                                            fontSize: 50.0,
                                            color: Colors.white
                                          ),
                                        ),
                                        color: Colors.yellow,
                                        width: MediaQuery.of(context).size.width * 0.9,
                                        height: MediaQuery.of(context).size.height * 0.8,
                                        alignment: Alignment.center,
                                      ),
                                      alignment: Alignment.center,
                                    ),
                                  );
                                });
                          },
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 22.0,
                        )))),
          ],
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 0.2,
                child: Container(
                  height: 1000.0,
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
                  children: <Widget>[
                    Container(
                      color: Colors.deepOrange,
                      width: 80.0,
                      height: 80.0,
                      margin: EdgeInsets.all(20.0),
                    ),
                    Container(
                      color: Colors.pink,
                      width: 80.0,
                      height: 80.0,
                      margin: EdgeInsets.all(20.0),
                    ),
                    Container(
                      color: Colors.lightGreenAccent,
                      width: 80.0,
                      height: 80.0,
                      margin: EdgeInsets.all(20.0),
                    ),
                    Container(
                      color: Colors.greenAccent,
                      width: 80.0,
                      height: 80.0,
                      margin: EdgeInsets.all(20.0),
                    ),
                    Container(
                      color: Colors.amber,
                      width: 80.0,
                      height: 80.0,
                      margin: EdgeInsets.all(20.0),
                    ),
                    Container(
                      color: Colors.blueAccent,
                      width: 80.0,
                      height: 80.0,
                      margin: EdgeInsets.all(20.0),
                    ),
                    Container(
                      color: Colors.cyanAccent,
                      width: 80.0,
                      height: 80.0,
                      margin: EdgeInsets.all(20.0),
                    ),
                    Container(
                      color: Colors.deepPurple,
                      width: 80.0,
                      height: 80.0,
                      margin: EdgeInsets.all(20.0),
                    ),
                    Container(
                      color: Colors.yellow,
                      width: 80.0,
                      height: 80.0,
                      margin: EdgeInsets.all(20.0),
                    ),
                    Container(
                      color: Colors.blueGrey,
                      width: 80.0,
                      height: 80.0,
                      margin: EdgeInsets.all(20.0),
                    ),
                  ],
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 80.0,
                      height: 80.0,
                      margin: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 80.0,
                      height: 80.0,
                      margin: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 80.0,
                      height: 80.0,
                      margin: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 80.0,
                      height: 80.0,
                      margin: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Colors.cyan,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 80.0,
                      height: 80.0,
                      margin: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 80.0,
                      height: 80.0,
                      margin: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 80.0,
                      height: 80.0,
                      margin: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Colors.pink,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 80.0,
                      height: 80.0,
                      margin: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 80.0,
                      height: 80.0,
                      margin: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 80.0,
                      height: 80.0,
                      margin: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Colors.indigo,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
              ),
            ]),
        bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
    ),
    );
  }
}
