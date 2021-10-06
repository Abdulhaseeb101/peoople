import 'package:flutter/material.dart';
import 'package:newflut_app/screens/details.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';
class OtpPage extends StatefulWidget {
  const OtpPage({Key key}) : super(key: key);

  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP Verification', style: TextStyle(color: Colors.grey),),
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.grey,
            onPressed: () {
              Navigator.pop(context, false);
            },
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 30.0,),
            Text(
              'OTP Verification',
              style: TextStyle(fontSize: 40.0)
            ),
            Text(
              'We\'ve an OTP to your entered number',
              style: TextStyle(fontSize: 20.0)
            ),
            SizedBox(height: 80.0,),
            PinEntryTextField(
              onSubmit: (String pin){
                // Enter code here to utilize the pin variable
              }, // end onSubmit
            ),
            SizedBox(height: 190.0),
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: 300.0),
              child: ElevatedButton(
                child: Text('Verify'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsPage(),
                      ));
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white10,
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}
