import 'package:carousel_slider/carousel_slider.dart';
import "package:flutter/material.dart";
import 'package:newflut_app/constants.dart';
import 'package:newflut_app/helper/sizeConfig.dart';
import 'package:newflut_app/services/services.dart';

class AppointmentsDetails extends StatefulWidget {
  String url;

  AppointmentsDetails(String url) {
    this.url = url;
  }

  @override
  _AppointmentsDetailsState createState() => _AppointmentsDetailsState();
}

class _AppointmentsDetailsState extends State<AppointmentsDetails> {
  final List<String> imgList = [
    // path to images used in the image carousel
    'images/c1.jpg',
    'images/m1.jpeg',
    'images/w1.jpeg',
    'images/w3.jpeg',
  ];

  CarouselController _customCarouselController =
      CarouselController(); // controller for the image carousel

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SizedBox(
        child: Column(children: [
          SizedBox(height: getProportionateHeight(context, 0.05)),
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
            ],
          ),
          SizedBox(height: getProportionateHeight(context, 0.01),),
          FutureBuilder(
            future: fetchAppointmentsSubCatDetails(widget.url),
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
                return SizedBox(
                  height: getProportionateHeight(context, 0.6),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(children: [
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                              child: Row(
                            children: [
                              SizedBox(width: getProportionateWidth(context, 0.01),),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Column(
                                    children: [
                                      Text(
                                          '$index',
                                        style: TextStyle(
                                          fontSize: 20.0
                                        ),
                                      ),
                                      Text(
                                          snapshot.data[index].name,
                                        style: TextStyle(
                                          fontSize: 18.0
                                        )
                                      ),
                                      SizedBox(height: getProportionateHeight(context, 0.05))
                                    ],
                                  ),
                                ),
                              ),
                              Placeholder(
                                  fallbackHeight: getProportionateHeight(context, 0.1),
                                  fallbackWidth: getProportionateWidth(context, 0.2),
                                ),
                              SizedBox(width: getProportionateWidth(context, 0.01),)
                            ],
                          )
                          );
                        },
                      ),
                    ]),
                  ),
                );
              }
            },
          )
        ]),
      ),
    )));
  }
}
