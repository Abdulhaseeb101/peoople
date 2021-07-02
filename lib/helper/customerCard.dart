import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newflut_app/constants.dart';
import 'package:newflut_app/helper/sizeConfig.dart';
import 'package:flip_card/flip_card.dart';
import 'package:newflut_app/services/services.dart';

class CustomerCard extends StatefulWidget {
  @override
  _CustomerCardState createState() => _CustomerCardState();
}

class _CustomerCardState extends State<CustomerCard> {
  var custData;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchCustomerInfo(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          custData = snapshot.data;
          if(custData == null) {
            return Center(
              child: Row(
                children: <Widget>[
                  CircularProgressIndicator(),
                  Text('Loading...'),
                ],
              ),
            );
          } else {
            return FlipCard(
                direction: FlipDirection.HORIZONTAL,
                front: Container(
                  width: getProportionateHeight(context, 0.48),
                  height: getProportionateWidth(context, 0.55),
                  decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(colors: [
                        Colors.black87,
                        Colors.black12,
                      ])),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 5,
                        left: 5,
                        child: Container(
                          margin: EdgeInsets.all(10.0),
                          child: CircleAvatar(
                            foregroundImage: NetworkImage('https://picsum.photos/250?image=9'),
                            radius: 35.0,
                          ),
                        ),
                      ),
                      Positioned(
                          top: 20,
                          right: 10,
                          child: Text(
                            'Earned',
                            style: TextStyle(
                              fontSize: 12,
                              color: PTextColor,
                            ),
                          )),
                      Positioned(
                        top: 35,
                        right: 5,
                        child: Container(
                          child: Text(
                            custData.earned,
                            style: TextStyle(
                                color: STextColor,
                                fontSize: 25.0,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
                      Center(
                        child: Positioned(
                          top: 100,
                          child: Text(
                            custData.custId,
                            style: TextStyle(color: STextColor, fontSize: 18.0),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 150,
                        left: 10,
                        child: Text(
                          'Account Name',
                          style: TextStyle(color: PTextColor, fontSize: 12.0),
                        ),
                      ),
                      Positioned(
                        top: 160,
                        left: 10,
                        child: Text(
                          custData.custName,
                          style: TextStyle(
                              color: STextColor,
                              fontSize: 25.0,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                      Positioned(
                        bottom: 30,
                        right: 30,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
                          height: getProportionateHeight(context, 0.03),
                          child: Image(
                            image: AssetImage('Assets/pngfind.com-aai-png-3728789.png'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                back: Container(
                  width: getProportionateHeight(context, 0.48),
                  height: getProportionateWidth(context, 0.55),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(colors: [
                      Colors.black12,
                      Colors.black87,
                    ]),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 20,
                        left: 20,
                        child: Text(custData.custName,
                            style: TextStyle(
                                color: STextColor,
                                fontSize: 25.0,
                                fontWeight: FontWeight.w900)),
                      ),
                      Positioned(
                        top: 60,
                        left: 20,
                        child: Container(
                          width: getProportionateWidth(context, 0.7),
                          child: Text(
                            custData.custAddrs,
                            style: TextStyle(color: PTextColor, fontSize: 18.0),
                          ),
                        ),
                      ),
                      Positioned(
                        child: Text(
                          custData.custEmail,
                          style: TextStyle(color: PTextColor, fontSize: 18.0),
                        ),
                        top: 120,
                        left: 20,
                      ),
                      Positioned(
                        top: 160,
                        left: 20,
                        child: Text(
                          custData.custPhone,
                          style: TextStyle(color: PTextColor, fontSize: 18.0),
                        ),
                      ),
                    ],
                  ),
                )
            );
          }
        }
    );
  }
}
