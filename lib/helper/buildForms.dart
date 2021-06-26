import 'package:flutter/material.dart';
import 'package:newflut_app/constants.dart';
import 'package:newflut_app/helper/sizeConfig.dart';
import 'package:newflut_app/screens/otpScreen.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  String email;
  String password;
  String confirmPassword;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailForm(),
          SizedBox(height: getProportionateHeight(context, 0.05)),
          buildPasswordForm(),
          SizedBox(height: getProportionateHeight(context, 0.05)),
          buildConfirmPasswordForm(),
          SizedBox(height: getProportionateHeight(context, 0.05)),
          SizedBox(
            width: getProportionateWidth(context, 1.0),
            child: TextButton(
              child: Text(
                'Submit',
                style: TextStyle(color: STextColor),
              ),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  // if all are valid then go to success screen
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OtpPage(),
                      ));
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(PColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                    ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextFormField buildEmailForm() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        email = value;
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Enter Email';
        }
        return null;
      },
      decoration: InputDecoration(
        fillColor: bgColor,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(
          Icons.alternate_email,
        ),
        labelText: 'Email',
        hintText: 'Enter your Email',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(BorderRadiusValue),
          borderSide: BorderSide(
            color: PColor,
            width: TextFieldBorderWidth,
          ),
        ),
      ),
    );
  }

  TextFormField buildPasswordForm() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        password = value;
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Enter Password';
        }
        return null;
      },
      decoration: InputDecoration(
        fillColor: bgColor,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(
          Icons.lock,
        ),
        labelText: 'Password',
        hintText: 'Enter your Password',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(BorderRadiusValue),
          borderSide: BorderSide(
            color: PColor,
            width: TextFieldBorderWidth,
          ),
        ),
      ),
    );
  }

  TextFormField buildConfirmPasswordForm() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => confirmPassword = newValue,
      onChanged: (value) {
        confirmPassword = value;
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Confirm your password';
        }
        if (confirmPassword != password) {
          return 'Make sure passwords match';
        }
        return null;
      },
      decoration: InputDecoration(
        fillColor: bgColor,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(
          Icons.lock,
        ),
        labelText: 'Confirm Password',
        hintText: 'Confirm your Password',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(BorderRadiusValue),
          borderSide: BorderSide(
            color: PColor,
            width: TextFieldBorderWidth,
          ),
        ),
      ),
    );
  }
}
