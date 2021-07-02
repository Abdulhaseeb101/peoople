import 'package:flutter/material.dart';
import 'package:newflut_app/helper/customerCard.dart';
import 'package:newflut_app/helper/mainNavigation.dart';
import 'package:newflut_app/helper/profileHelper.dart';
import 'package:newflut_app/menuOptionEnum.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: SafeArea(
          child: Center(
            child: Column(children: [
              CustomerCard(),
              SizedBox(height: 20.0),
              ProfileMenu(
                text: 'Delivery Address',
                icon: 'Assets/icons/Location.svg',
                press: () {},
              ),
              ProfileMenu(
                text: 'History and Refunds',
                icon: 'Assets/icons/History.svg',
                press: () {},
              ),
              ProfileMenu(
                text: 'Redeem',
                icon: 'Assets/icons/Rocket box.svg',
                press: () {},
              ),
              ProfileMenu(
                text: 'Settings',
                icon: 'Assets/icons/Settings.svg',
                press: () {},
              ),
              ProfileMenu(
                text: 'Help Center',
                icon: 'Assets/icons/Question mark.svg',
                press: () {},
              ),
            ]),
          ),
        ),
      ),
      bottomNavigationBar: MainBottomNavigationBar(
        selectedMenu: MenuState.profile,
      ),
    );
  }
}
