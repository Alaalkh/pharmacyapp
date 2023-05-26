import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharmacyapp/Pages/HomeBottomNavigation.dart';
import 'package:pharmacyapp/Pages/HomePage.dart';
import 'package:pharmacyapp/Pages/ImportantMed.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../Provider/Controller.dart';
import 'constants.dart';
import 'models/Medicine.dart';

class DetailsMed extends StatelessWidget {
  final id;
  final Medname;
  final time;
  final Medtype;
  final dose;
  const DetailsMed(
      {Key? key, this.id, this.Medname, this.Medtype, this.time, this.dose})
      : super(key: key);

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
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 55, left: 22),
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
                            width: 33.w,
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()));
                              },
                              icon: Icon(
                                Icons.favorite_border,
                                color: Colors.redAccent,
                              ))
                        ],
                      ),
                      Text(
                        " ${Medname}",
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
                        "  ${dose}mg",
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
                      Text(" ${Medtype}",
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
                      Text(" ${time}",
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
        ));
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
              margin: const EdgeInsets.only(top: 55, left: 22),
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
                          margin: const EdgeInsets.only(top: 12, left: 126),
                          child: Icon(
                            Icons.add_box_outlined,
                            color: kSecondaryColor,
                            size: 33,
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
