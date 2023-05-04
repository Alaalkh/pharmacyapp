import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import 'constants.dart';

class DetailsMed extends StatelessWidget {
  const DetailsMed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
        centerTitle: true,
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          DetailsWidgt(),
          SizedBox(
            height: 13.h,
          ),
          Row(
            children: [BottomButton()],
          )
        ],
      ),
    );
  }
}

class DetailsWidgt extends StatelessWidget {
  const DetailsWidgt({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 55, left: 33),
              child: SvgPicture.asset(
                "images/bottle.svg",
                height: 70,
                color: kotherColor,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 55, left: 74),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        "Medicine Name",
                        style: TextStyle(color: Colors.grey, fontSize: 17),
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      GestureDetector(
                        child: Container(
                          child: Icon(
                            Icons.favorite_outline_sharp,
                            color: kSecondaryColor,
                            size: 44,
                          ),
                        ),
                      )
                    ],
                  ),
                  Text(
                    "Bottle",
                    style: TextStyle(
                        color: kTextColor,
                        fontSize: 23,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Text(
                    "Dosage",
                    style: TextStyle(color: Colors.grey, fontSize: 17),
                  ),
                  Text(
                    "500 mg",
                    style: TextStyle(
                        color: kTextColor,
                        fontSize: 23,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 2.h,
        ),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(top: 3.h, left: 7.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Medcinie Type",
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text("Pill",
                      style: TextStyle(
                        color: kErrorBorderColor,
                        fontSize: 16,
                      ))
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: 2.h,
        ),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(top: 3.h, left: 7.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Dose Interval",
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text("8 hours",
                      style: TextStyle(
                        color: kErrorBorderColor,
                        fontSize: 16,
                      ))
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: 2.h,
        ),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(top: 3.h, left: 7.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Start Time",
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text("06:41",
                      style: TextStyle(
                        color: kErrorBorderColor,
                        fontSize: 16,
                      ))
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}

class BottomButton extends StatelessWidget {
  const BottomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(22),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(44),
        ),
        child: MaterialButton(
          onPressed: () {},
          child: Text(
            "Delete",
            style: TextStyle(fontSize: 17),
          ),
        ),
      ),
    );
  }
}
