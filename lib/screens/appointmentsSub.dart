import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import 'package:newflut_app/constants.dart';
import 'package:newflut_app/helper/sizeConfig.dart';
import 'package:newflut_app/services/services.dart';
import 'package:newflut_app/screens/appointmentsDetails.dart';

class AppointmentsSub extends StatefulWidget {
  String url;
  AppointmentsSub(String url) {
    this.url = url;
  }

  @override
  _AppointmentsSubState createState() => _AppointmentsSubState();
}

class _AppointmentsSubState extends State<AppointmentsSub> {

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
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: getProportionateHeight(context, 0.05),),
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
                ),
              ],
            ),
            SizedBox(
              height: getProportionateHeight(context, 0.01),
            ),
            SingleChildScrollView(
              child: FutureBuilder(
                future: fetchAppointmentsSubCat(widget.url),
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
                      height: getProportionateHeight(context, 0.6),
                      child: GridView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: snapshot.data.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 3,
                            mainAxisSpacing: 3,
                          ),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AppointmentsDetails("https://peopplemockerserver.herokuapp.com/get_appoint_sub_cat_details"),
                                    ));
                              },
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.blueGrey,
                                    ),
                                    height: 100,
                                    width: 100,
                                  ),
                                  Text(
                                    snapshot.data[index].label,
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
