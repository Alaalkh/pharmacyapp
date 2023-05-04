import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharmacyapp/Pages/ImportantMed.dart';
import 'package:pharmacyapp/Pages/UpdateMed.dart';
import 'package:pharmacyapp/Pages/constants.dart';
import 'package:pharmacyapp/Pages/newMed.dart';
import 'package:sizer/sizer.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'DetailsMed.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentindex = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        TopContainer(),
        Row(
          children: [
            BottomContainer(),
            BottomContainer2(),
          ],
        )
      ],
    );
  }
}

class TopContainer extends StatelessWidget {
  const TopContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.h),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(bottom: 1),
            child: Text(
              "Worry less. \n live healthier",
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF564850),
                  fontSize: 24.sp),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(bottom: 1),
            child: Text(
              "WelCome To Daily Dose",
              style: TextStyle(fontSize: 12.sp, color: Color(0xFF564850)),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
        ],
      ),
    );
  }
}

class BottomContainer extends StatelessWidget {
  const BottomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DetailsMed()));
      },
      child: Container(
        margin: EdgeInsets.only(left: 17),
        width: 177,
        height: 177,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(22)),
        child: Column(
          children: [
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: SvgPicture.asset(
                    "images/pill.svg",
                    color: kotherColor,
                    height: 7.h,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 7,
            ),
            Container(
              margin: const EdgeInsets.only(right: 100),
              child: Text(
                "Pill",
                style: TextStyle(
                    color: kTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 7,
            ),
            Container(
              margin: const EdgeInsets.only(right: 55),
              child: Text(
                "Every 12 hours",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UpdateMed()));
              },
              child: Container(
                margin: const EdgeInsets.only(left: 99),
                child: Icon(
                  Icons.edit,
                  color: kPrimaryColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BottomContainer2 extends StatelessWidget {
  const BottomContainer2({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DetailsMed()));
      },
      child: Container(
        margin: EdgeInsets.only(left: 17),
        width: 177,
        height: 177,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(22)),
        child: Column(
          children: [
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: SvgPicture.asset(
                    "images/bottle.svg",
                    color: kotherColor,
                    height: 7.h,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 7,
            ),
            Container(
              margin: const EdgeInsets.only(right: 100),
              child: Text(
                "Bottle",
                style: TextStyle(
                    color: kTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 7,
            ),
            Container(
              margin: const EdgeInsets.only(right: 55),
              child: Text(
                "Every 12 hours",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UpdateMed()));
              },
              child: Container(
                margin: const EdgeInsets.only(left: 99),
                child: Icon(
                  Icons.edit,
                  color: kPrimaryColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
