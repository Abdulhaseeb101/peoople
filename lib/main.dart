import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:newflut_app/Screens/otpScreen.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: SignInPage()));
}

class SignInPage extends StatefulWidget {

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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
              style: TextStyle(fontSize: 40.0),
            ),
            Text(
              'Sign in with your Mobile Number',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 70),
            Row(
              children: [
                CountryCodePicker(
                  onChanged: print,
                  initialSelection: 'IN',
                  showFlag: true,
                  showCountryOnly: true,
                ),
                Expanded(
                    child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Phone Number',
                      hintText: 'Enter Phone Number'),
                ))
              ],
            ),
            SizedBox(
              height: 200.0,
            ),
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: 300.0),
              child: ElevatedButton(
                child: Text('Continue'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OtpPage(),
                      ));
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white10,
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
