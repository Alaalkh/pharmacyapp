import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharmacyapp/Pages/HomePage.dart';
import 'package:pharmacyapp/Provider/Controller.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'Pages/SplachSceen.dart';
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
      return ChangeNotifierProvider<DbController>(
        create: (context) => DbController(),
        child: MaterialApp(
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
              colorScheme:
                  ThemeData().colorScheme.copyWith(primary: kotherColor),
              appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(color: kSecondaryColor, size: 20.sp),
                backgroundColor: kScaffoldCelor,
                elevation: 0,
              )),
          home: SplachScreen(),
        ),
      );
    });
  }
}
