import 'package:flutter/material.dart';
import 'package:newflut_app/helper/mainNavigation.dart';
import 'package:newflut_app/menuOptionEnum.dart';

class Cart extends StatefulWidget {
  const Cart({Key key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.lightBlue,
          child: Text(
            'Cart Screen',
            style: TextStyle(
              color: Colors.white
            ),
          ),
        ),
      ),
      bottomNavigationBar: MainBottomNavigationBar(
        selectedMenu: MenuState.cart,
      ),
    );
  }
}
