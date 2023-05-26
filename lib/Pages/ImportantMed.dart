import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharmacyapp/Pages/constants.dart';
import 'package:pharmacyapp/Pages/models/Medicine.dart';
import 'package:sizer/sizer.dart';

class ImportantMed extends StatelessWidget {
  final id;
  final Medname;
  final time;
  final Medtype;
  final dose;
  const ImportantMed(
      {Key? key, this.id, this.Medname, this.Medtype, this.time, this.dose})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Favourite",
            style: TextStyle(color: kTextColor),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(22)),
              margin: EdgeInsets.all(12),
              child: Text(
                "Pill",
                style: TextStyle(color: kScaffoldCelor, fontSize: 22),
              ),
            )
          ],
        ));
  }
}
