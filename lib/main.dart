import 'package:flutter/material.dart';
import 'package:newflut_app/constants.dart';
import 'package:newflut_app/helper/sizeConfig.dart';
import 'package:newflut_app/helper/buildForms.dart';
import 'package:newflut_app/screens/cart.dart';
import 'package:newflut_app/screens/favorites.dart';
import 'package:newflut_app/screens/homeScreen.dart';
import 'package:newflut_app/screens/notifications.dart';
import 'package:newflut_app/screens/profile.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false,
                      home: SignInPage(),
                      routes: {
                        '/HomeScreen': (BuildContext context) => Home(),
                        '/ProfileScreen': (BuildContext context) => Profile(),
                        '/Cart': (BuildContext context) => Cart(),
                        '/Favorites': (BuildContext context) => Favorites(),
                        '/Notifications': (BuildContext) => Notifications(),
                      },
          )
  );
}

class SignInPage extends StatefulWidget {


  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  // Variables to store data acquired from textfields
  String email;
  String password;
  String confirmPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In', style: TextStyle(color: Colors.grey)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Column(
          children: [
            SizedBox(height: 80),
            Text(
              'Welcome',
              style: TextStyle(
                fontSize: getProportionateWidth(context, 0.10),
                fontWeight: FontWeight.bold,
                color: PTextColor,
              ),
            ),
            Text(
              'Sign in with your Email',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: getProportionateWidth(context, 0.05),
                color: STextColor,
              ),
            ),
            SizedBox(height: getProportionateHeight(context, 0.05),),
            SizedBox(child:SignUpForm(), width: getProportionateWidth(context, 0.9),),
          ],
        ),
      )),
    );
  }
}
