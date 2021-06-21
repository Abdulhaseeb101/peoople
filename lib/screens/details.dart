import 'package:flutter/material.dart';
import 'homeScreen.dart';

Row addRadioButton(int btnValue, String title) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Radio(
        activeColor: Colors.blue,
        value: btnValue,
        groupValue: 1,
        onChanged: (val) {
          print(val);
        },
      ),
      Text(title)
    ],
  );
}

class DetailsPage extends StatefulWidget {

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details', style: TextStyle(color: Colors.grey)),
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
      body: SingleChildScrollView(
          child: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30.0,
            ),
            Text(
              'Complete Profile',
              style: TextStyle(fontSize: 40.0, color: Colors.grey),
            ),
            Text(
              'Specify your details below and continue',
              style: TextStyle(fontSize: 20.0, color: Colors.grey),
            ),
            SizedBox(
              height: 30.0,
            ),
            TextField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'First Name',
                  hintText: 'Enter your first name',
                  suffixIcon: Icon(Icons.people_alt_rounded)),
            ),
            SizedBox(
              height: 30.0,
            ),
            TextField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Last Name',
                  hintText: 'Enter your last name',
                  suffixIcon: Icon(Icons.people_alt_rounded)),
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Gender: '),
                addRadioButton(0, 'Male'),
                addRadioButton(1, 'Female'),
                addRadioButton(2, 'Others'),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  hintText: 'Enter your email address',
                  suffixIcon: Icon(Icons.email_rounded)),
            ),
            SizedBox(
              height: 30.0,
            ),
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: 300.0),
              child: ElevatedButton(
                child: Text('Continue'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Home(),
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
