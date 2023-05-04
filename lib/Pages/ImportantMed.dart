import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharmacyapp/Pages/constants.dart';
import 'package:sizer/sizer.dart';

class ImportantMed extends StatelessWidget {
  const ImportantMed({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 17, right: 17),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(22)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
              Container(
                margin: const EdgeInsets.only(right: 200),
                child: Text(
                  "Pill",
                  style: TextStyle(
                      color: kTextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 34),
                child: Icon(
                  Icons.favorite_outlined,
                  color: kSecondaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
