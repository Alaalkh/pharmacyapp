import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pharmacyapp/Pages/HomePage.dart';
import 'package:pharmacyapp/Pages/ImportantMed.dart';
import 'package:pharmacyapp/Pages/constants.dart';
import 'package:sizer/sizer.dart';

import 'newMed.dart';

class HomeNavigation extends StatefulWidget {
  const HomeNavigation({super.key});

  @override
  State<HomeNavigation> createState() => _HomeNavigationState();
}

class _HomeNavigationState extends State<HomeNavigation> {
  int currentindex = 0;
  List<Widget> selected = [HomePage(), ImportantMed()];
  List<String> titles = ["Home", "Important Medicine"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          titles[currentindex],
          style: TextStyle(color: kTextColor),
        ),
        backgroundColor: kScaffoldCelor,
      ),
      body: selected[currentindex],
      floatingActionButton: InkResponse(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => NewMedPage()));
        },
        child: SizedBox(
          width: 18.w,
          height: 9.h,
          child: Card(
            color: kPrimaryColor,
            shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(3.h)),
            child: Icon(
              Icons.add_outlined,
              color: kScaffoldCelor,
              size: 50.sp,
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: kotherColor,
          selectedItemColor: kSecondaryColor,
          currentIndex: currentindex,
          onTap: (index) {
            setState(() {
              currentindex = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "Favourite")
          ]),
    );
  }
}
