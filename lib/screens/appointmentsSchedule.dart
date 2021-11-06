import 'package:flutter/material.dart';
import 'package:newflut_app/constants.dart';
import 'package:newflut_app/helper/sizeConfig.dart';
import 'package:weekday_selector/weekday_selector.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

class AppointmentsSchedule extends StatefulWidget {
  const AppointmentsSchedule({Key key}) : super(key: key);

  @override
  _AppointmentsScheduleState createState() => _AppointmentsScheduleState();
}

class _AppointmentsScheduleState extends State<AppointmentsSchedule> {

  final dayValues = List.filled(7, true);
  DateTime _dateTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(height: getProportionateHeight(context, 0.02)),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Day",
                  style: TextStyle(
                    color: PTextColor,
                    fontSize: getProportionateWidth(context, 0.08)
                  ),
                ),
              ),
              SizedBox(height: getProportionateHeight(context, 0.02),),
              WeekdaySelector(
                onChanged: (int day) {
                  setState(() {
                    final index = day % 7;
                    dayValues[index] = !dayValues[index];
                  });
                },
                values: dayValues,
              ),
              SizedBox(height: getProportionateHeight(context, 0.02)),
              TimePickerSpinner(
                is24HourMode: false,
                normalTextStyle: TextStyle(
                  fontSize: 22.0,
                  color: STextColor,
                ),
                highlightedTextStyle: TextStyle(
                  fontSize: 24.0,
                  color: PTextColor,
                ),
                spacing: 90,
                itemHeight: 60,
                isForce2Digits: false,
                onTimeChange: (time) {
                  setState(() {
                    _dateTime = time;
                  });
                }
              ),
              Divider(
                color: PColor,
                thickness: 2.0,
              ),
              SizedBox(height: getProportionateHeight(context, 0.02),),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Fee",
                  style: TextStyle(
                    color: PTextColor,
                    fontSize: getProportionateWidth(context, 0.08)
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    SizedBox(height: getProportionateHeight(context, 0.1)),
                    Text(
                      '100.00',
                      style: TextStyle(
                        fontSize: getProportionateWidth(context, 0.2)
                      )
                    ),
                    TextButton(
                      child: Text(
                        'Pay',
                        style: TextStyle(
                          color: STextColor,
                        ),
                      ),
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(PColor),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}
