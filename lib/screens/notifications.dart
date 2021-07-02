import 'package:flutter/material.dart';
import 'package:newflut_app/helper/mainNavigation.dart';
import 'package:newflut_app/menuOptionEnum.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.deepOrange,
          child: Text(
            'Notifications Screen',
            style: TextStyle(
                color: Colors.white
            ),
          ),
        ),
      ),
      bottomNavigationBar: MainBottomNavigationBar(
        selectedMenu: MenuState.notification,
      ),
    );
  }
}
