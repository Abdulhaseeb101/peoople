import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:newflut_app/constants.dart';
import 'package:newflut_app/helper/sizeConfig.dart';
import 'package:newflut_app/screens/appointmentsSub.dart';

class AppointmentsMain extends StatefulWidget {
  const AppointmentsMain({Key key}) : super(key: key);

  @override
  _AppointmentsMainState createState() => _AppointmentsMainState();
}

class _AppointmentsMainState extends State<AppointmentsMain> {

  final List<String> imgList = [  // path to images used in the image carousel
    'images/c1.jpg',
    'images/m1.jpeg',
    'images/w1.jpeg',
    'images/w3.jpeg',
  ];

  List<Widget> _drawAppointmentCategories() {
    return [
      GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AppointmentsSub("https://peopplemockerserver.herokuapp.com/get_appoint_sub_cat"),
              ));
        },
        child: Column(
          children: [
            Container(
              width: 80.0,
              height: 80.0,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.blueGrey
              ),
              margin: EdgeInsets.all(10.0),
            ),
            Text("Doctor"),
          ],
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AppointmentsSub("https://peopplemockerserver.herokuapp.com/get_appoint_sub_cat"),
              ));
        },
        child: Column(
          children: [
            Container(
              width: 80.0,
              height: 80.0,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.blueGrey
              ),
              margin: EdgeInsets.all(10.0),
            ),
            Text("Salon"),
          ],
        ),
      ),
      GestureDetector(
        child: Column(
          children: [
            Container(
              width: 80.0,
              height: 80.0,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.blueGrey
              ),
              margin: EdgeInsets.all(10.0),
            ),
            Text("Architect"),
          ],
        ),
      ),
      GestureDetector(
        child: Column(
          children: [
            Container(
              width: 80.0,
              height: 80.0,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.blueGrey
              ),
              margin: EdgeInsets.all(10.0),
            ),
            Text("Labs"),
          ],
        ),
      )
    ];
  }

  CarouselController _customCarouselController = CarouselController();  // controller for the image carousel
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
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
            SizedBox(height: getProportionateHeight(context, 0.02),),
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
            SizedBox(height: getProportionateHeight(context, 0.02)),
            SizedBox(
              height: 120.0,
              child: ListView(
                children: _drawAppointmentCategories(),
                scrollDirection: Axis.horizontal,
              ),
            ),
            SizedBox(height: getProportionateHeight(context, 0.02),),
            Text(
              "Upcoming Appointments",
              style: TextStyle(
                fontSize: getProportionateWidth(context, 0.08)
              ),
            ),
            SizedBox(height: getProportionateHeight(context, 0.02),),
            SizedBox(
              height: getProportionateHeight(context, 0.3),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Container(
                      width: getProportionateWidth(context, 0.9),
                      height: getProportionateHeight(context, 0.07),
                      child: Center(child: Text("Doctor at 12", style: TextStyle(fontSize: getProportionateWidth(context, 0.06)),)),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                      ),
                    ),
                    Container(
                      width: getProportionateWidth(context, 0.9),
                      height: getProportionateHeight(context, 0.07),
                      child: Center(child: Text("Salon at 2", style: TextStyle(fontSize: getProportionateWidth(context, 0.06)),)),
                      decoration: BoxDecoration(
                        color: Colors.deepOrange,
                      ),
                    ),
                    Container(
                      width: getProportionateWidth(context, 0.9),
                      height: getProportionateHeight(context, 0.07),
                      child: Center(child: Text("Lab at 7", style: TextStyle(fontSize: getProportionateWidth(context, 0.06)),)),
                      decoration: BoxDecoration(
                        color: Colors.pink,
                      ),
                    ),
                    Container(
                      width: getProportionateWidth(context, 0.9),
                      height: getProportionateHeight(context, 0.07),
                      child: Center(child: Text("Mechanic at 5", style: TextStyle(fontSize: getProportionateWidth(context, 0.06)),)),
                      decoration: BoxDecoration(
                        color: Colors.yellowAccent,
                      ),
                    ),
                    Container(
                      width: getProportionateWidth(context, 0.9),
                      height: getProportionateHeight(context, 0.07),
                      child: Center(child: Text("Laundry at 5", style: TextStyle(fontSize: getProportionateWidth(context, 0.06)),)),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                      ),
                    ),
                    Container(
                      width: getProportionateWidth(context, 0.9),
                      height: getProportionateHeight(context, 0.07),
                      child: Center(child: Text("Architext at 6", style: TextStyle(fontSize: getProportionateWidth(context, 0.06)),)),
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
