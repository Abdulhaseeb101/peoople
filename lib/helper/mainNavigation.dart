import 'package:flutter/material.dart';
import 'package:newflut_app/constants.dart';
import 'package:newflut_app/menuOptionEnum.dart';

// This file contains the code for the custom bottom
// navigation bar present at the bottom of the
// three pages.

class MainBottomNavigationBar extends StatelessWidget {
  const MainBottomNavigationBar({
    Key key,
    @required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = STextColor;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.5),
      decoration: BoxDecoration(
        color: PColor,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        )
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.person),
              color: MenuState.profile == selectedMenu
                ? PTextColor
                : inActiveIconColor,
              onPressed: () {
                if(selectedMenu != MenuState.profile) {
                  Navigator.pushNamed(context, '/ProfileScreen');
                }
              },
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart),
              color: MenuState.cart == selectedMenu
                  ? PTextColor
                  : inActiveIconColor,
              onPressed: () {
                if(selectedMenu != MenuState.cart) {
                  Navigator.pushNamed(context, '/Cart');
                }
              },
            ),
            IconButton(
              iconSize: 20.0,
              icon: Icon(Icons.home),
              color: MenuState.home == selectedMenu
                  ? PTextColor
                  : inActiveIconColor,
              onPressed: () {
                if(selectedMenu != MenuState.home) {
                  Navigator.pushNamed(context, '/HomeScreen');
                }
              },
            ),
            IconButton(
              icon: Icon(Icons.assistant),
              color: MenuState.favorites == selectedMenu
                  ? PTextColor
                  : inActiveIconColor,
              onPressed: () {
                if(selectedMenu != MenuState.favorites) {
                  Navigator.pushNamed(context, '/Favorites');
                }
              },
            ),
            IconButton(
              icon: Icon(Icons.notifications),
              color: MenuState.notification == selectedMenu
                  ? PTextColor
                  : inActiveIconColor,
              onPressed: () {
                if(selectedMenu != MenuState.notification) {
                  Navigator.pushNamed(context, '/Notifications');
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
