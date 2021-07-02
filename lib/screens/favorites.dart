import 'package:flutter/material.dart';
import 'package:newflut_app/helper/mainNavigation.dart';
import 'package:newflut_app/menuOptionEnum.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key key}) : super(key: key);

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.amberAccent,
          child: Text(
            'Favorites Screen',
            style: TextStyle(
                color: Colors.white
            ),
          ),
        ),
      ),
      bottomNavigationBar: MainBottomNavigationBar(
        selectedMenu: MenuState.favorites,
      ),
    );
  }
}
