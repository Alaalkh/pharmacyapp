import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pharmacyapp/Pages/HomeBottomNavigation.dart';
import 'package:pharmacyapp/Pages/HomePage.dart';
import 'package:pharmacyapp/Pages/constants.dart';

class SplachScreen extends StatelessWidget {
  const SplachScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 122),
            child: Center(
              child: Text(
                "Medicine Reminder ",
                style: TextStyle(fontSize: 38, color: kotherColor),
              ),
            ),
          ),
          SizedBox(
            height: 27.0,
          ),
          Image(image: AssetImage("images/pill1.jpg")),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 77.0,
              ),
              Container(
                margin: EdgeInsets.only(right: 23, left: 23),
                width: double.infinity,
                height: 65.0,
                decoration: BoxDecoration(
                    color: kotherColor,
                    borderRadius: BorderRadius.circular(13)),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                        color: kScaffoldCelor,
                        fontSize: 22,
                        fontWeight: FontWeight.w800),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
