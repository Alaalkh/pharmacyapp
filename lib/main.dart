import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharmacyapp/Pages/HomeBottomNavigation.dart';
import 'package:pharmacyapp/Pages/HomePage.dart';
import 'package:sizer/sizer.dart';

import 'Pages/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, Orientation, DeviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Pill Reminder",
        theme: ThemeData.dark().copyWith(
            timePickerTheme: TimePickerThemeData(
                backgroundColor: kScaffoldCelor,
                hourMinuteColor: kTextColor,
                hourMinuteTextColor: kScaffoldCelor,
                dialHandColor: kPrimaryColor,
                dialBackgroundColor: kTextColor,
                entryModeIconColor: kotherColor,
                dayPeriodColor: kTextColor),
            scaffoldBackgroundColor: kScaffoldCelor,
            primaryColor: kPrimaryColor,
            appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(color: kSecondaryColor, size: 20.sp),
              backgroundColor: kScaffoldCelor,
              elevation: 0,
            )),
        home: HomeNavigation(),
      );
    });
  }
}
