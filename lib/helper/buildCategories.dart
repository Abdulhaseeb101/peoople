import 'package:flutter/material.dart';

Widget buildCategories(
    AsyncSnapshot snapshot, String path, BuildContext context) {
  return SizedBox(
    height: 120.0,
    child: ListView.builder(
      itemCount: snapshot.data.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, int index) {
        return Column(children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, path);
            },
            child: Container(
              width: 80.0,
              height: 80.0,
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blueGrey,
              ),
            ),
          ),
          Align(
            child: Text(snapshot.data[index].label),
            alignment: Alignment.center,
          ),
        ]);
      },
    ),
  );
}
