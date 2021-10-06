import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newflut_app/constants.dart';
import 'package:newflut_app/helper/buildForms.dart';
import 'package:newflut_app/helper/sizeConfig.dart';
import 'package:newflut_app/screens/otpScreen.dart';

class SignUpSignIn extends StatefulWidget {
  @override
  _SignUpSignInState createState() => _SignUpSignInState();
}

class _SignUpSignInState extends State<SignUpSignIn> {
  bool isPhSignVisible = true;
  bool isGSignVisible = true;

  Widget _drawButtons(BuildContext context, String text) {
    return TextButton(
      child: SizedBox(
        width: getProportionateWidth(context, 0.8),
        height: getProportionateHeight(context, 0.05),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: getProportionateHeight(context, 0.022),
              color: PTextColor,
            ),
          ),
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(bgColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        )),
      ),
      onPressed: () {
        /*print(isVisiblePH);
        print(isVisibleG);
        if (isVisiblePH == true && isVisibleG == false) {
          setState(() {
            isVisiblePH = !isVisiblePH;
            isVisibleG = !isVisibleG;
          });
        }*/

        if(text == 'Sign In with Phone Number') {
          setState(() {
            isPhSignVisible = false;
            isGSignVisible = false;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In/Sign Up', style: TextStyle(color: Colors.grey)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 1000),
                  child: isPhSignVisible
                      ? _drawButtons(context, 'Sign In with Phone Number') : SizedBox(child: buildPhoneNumberForm(), width: getProportionateWidth(context, 0.85),)), // drawing button using a functions call
            ),
            SizedBox(
              height: getProportionateHeight(context, 0.02),
            ),
            Center(
                child: SizedBox(
              width: getProportionateWidth(context, 0.9),
              height: getProportionateHeight(context, 0.07),
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                child: isGSignVisible
                    ? _drawButtons(context, 'Sign In with Google')
                    : TextButton(
                        child: SizedBox(
                          width: getProportionateWidth(context, 0.8),
                          height: getProportionateHeight(context, 0.05),
                          child: Center(
                            child: Text(
                              'Confirm',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize:
                                    getProportionateHeight(context, 0.022),
                                color: PTextColor,
                              ),
                            ),
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(bgColor),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          )),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OtpPage(),
                              ));
                        },
                      ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
