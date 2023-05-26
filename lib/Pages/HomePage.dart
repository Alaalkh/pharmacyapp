import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharmacyapp/Pages/ImportantMed.dart';
import 'package:pharmacyapp/Pages/MedcinieList.dart';
import 'package:pharmacyapp/Pages/UpdateMed.dart';
import 'package:pharmacyapp/Pages/constants.dart';
import 'package:pharmacyapp/Pages/models/Medicine.dart';
import 'package:pharmacyapp/Pages/newMed.dart';
import 'package:pharmacyapp/Pages/searchPage.dart';
import 'package:pharmacyapp/Sqflite/Dbhelper.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../Provider/Controller.dart';
import 'DetailsMed.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentindex = 0;
  PageController pageController = PageController();
  void initState() {
    DbHelper.dbHelper.getAllmedicine();

    DbHelper.dbHelper.initDatabase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          actions: [
            Theme(
              data: Theme.of(context).copyWith(
                  textTheme: TextTheme().apply(bodyColor: Colors.black),
                  dividerColor: Colors.white,
                  iconTheme: IconThemeData(color: Colors.white)),
              child: PopupMenuButton<int>(
                color: Colors.black,
                itemBuilder: (context) => [
                  PopupMenuItem<int>(
                    value: 0,
                    child: Row(
                      children: [
                        Icon(
                          Icons.favorite_border,
                        ),
                        Text(
                          "Favourite",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuItem<int>(
                    value: 1,
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                        ),
                        Text(
                          "Search",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  )
                ],
                onSelected: (item) => SelectedItem(context, item),
              ),
            ),
          ],
          title: Text(
            "Home",
            style: TextStyle(color: kTextColor),
          ),
          centerTitle: true,
        ),
        body: Consumer<DbController>(
          builder: (context, controller, x) {
            return Column(
              children: [
                TopContainer(),
                Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: controller.medicine.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailsMed(
                                            id: controller.medicine[index].id,
                                            Medname: controller
                                                .medicine[index].Medname,
                                            dose:
                                                controller.medicine[index].dose,
                                            time:
                                                controller.medicine[index].time,
                                            Medtype: controller
                                                .medicine[index].Medtype,
                                          )));
                            },
                            child: Card(
                              shadowColor: Colors.grey,
                              color:
                                  index % 2 == 0 ? kotherColor : kPrimaryColor,
                              shape: BeveledRectangleBorder(
                                  borderRadius: BorderRadius.circular(13),
                                  side: BorderSide(
                                      color: kScaffoldCelor,
                                      style: BorderStyle.solid)),
                              child: ListTile(
                                trailing: IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => UpdateMed(
                                                  id: controller
                                                      .medicine[index].id,
                                                  Medname: controller
                                                      .medicine[index].Medname,
                                                  dose: controller
                                                      .medicine[index].dose,
                                                  time: controller
                                                      .medicine[index].time,
                                                  Medtype: controller
                                                      .medicine[index].Medtype,
                                                )));
                                  },
                                  icon: Icon(Icons.edit),
                                  color: kTextColor,
                                ),
                                leading: IconButton(
                                  onPressed: () {
                                    controller.deleteMedicine(
                                        controller.medicine[index].id!);
                                  },
                                  icon: Icon(Icons.delete_forever),
                                  color: kTextColor,
                                ),
                                title: Text(
                                  controller.medicine[index].Medname.toString(),
                                  style: TextStyle(
                                      color: kTextColor, fontSize: 22),
                                ),
                                subtitle: Text(
                                    controller.medicine[index].time.toString(),
                                    style: TextStyle(color: kTextColor)),
                              ),
                            ),
                          );
                        })),
                Container(
                  margin: const EdgeInsets.only(bottom: 17, left: 255),
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NewMedPage()));
                    },
                    child: Icon(Icons.add),
                    backgroundColor: kotherColor,
                  ),
                ),
              ],
            );
          },
        ));
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
          Row(
            children: [
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(bottom: 1),
                child: Row(
                  children: [
                    Text(
                      "Worry less. \n live healthier",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF564850),
                          fontSize: 24.sp),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 25.w,
              ),
            ],
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

void SelectedItem(BuildContext context, item) {
  switch (item) {
    case 0:
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => ImportantMed()));
      break;
    case 1:
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => SearchPage()));
      break;
  }
}
