import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pharmacyapp/Pages/HomePage.dart';
import 'package:pharmacyapp/Pages/MedcinieList.dart';
import 'package:pharmacyapp/Pages/models/Medicine.dart';
import 'package:pharmacyapp/Provider/Controller.dart';
import 'package:pharmacyapp/Sqflite/Dbhelper.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'constants.dart';

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late TextEditingController nameController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }
  // ignore: non_constant_identifier_names

  @override
  Widget build(BuildContext context) {
    return Consumer<DbController>(
      builder: (context, controller, child) {
        return Scaffold(
            appBar: AppBar(
              title: Text(
                "Search",
                style: TextStyle(color: kTextColor),
              ),
              centerTitle: true,
            ),
            body: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10, top: 8),
                  child: TextFormField(
                    controller: nameController,
                    onChanged: (value) {},
                    // controller: timeController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        fillColor: kotherColor,
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: kotherColor, width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        border: const OutlineInputBorder(),
                        labelText: 'Keyword ',
                        floatingLabelStyle: TextStyle(color: kTextColor),
                        labelStyle: TextStyle(color: kTextColor)),
                    style: TextStyle(fontSize: 12.sp, color: Color(0xFF564850))
                        .copyWith(color: kotherColor),
                  ),
                ),
                FutureBuilder(
                  future: DbHelper.dbHelper.searchContacts(nameController.text),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) print('error');
                    var data = snapshot.data;
                    return snapshot.hasData
                        ? MedcinieList()
                        : new Center(
                            child:
                                Text('No contacts that include this keyword'),
                          );
                  },
                ),
                SizedBox(
                  height: 3.h,
                ),
                // Expanded(
                //     child: ListView.builder(
                //         scrollDirection: Axis.vertical,
                //         itemCount: 3,
                //         itemBuilder: (context, index) {
                //           return GestureDetector(
                //             child: Container(
                //               decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.circular(10),
                //                 color:
                //                     index % 2 == 0 ? kotherColor : kPrimaryColor,
                //                 boxShadow: [
                //                   BoxShadow(
                //                     color: Color.fromARGB(255, 186, 185, 185)
                //                         .withOpacity(0.5),
                //                     spreadRadius: 5,
                //                     blurRadius: 7,
                //                     offset: Offset(
                //                         0, 3), // changes position of shadow
                //                   ),
                //                 ],
                //               ),
                //               child: ListTile(
                //                 title: Text(
                //                   "DbHelper.dbHelper.searchMedcinie(nameController.text)",
                //                   style:
                //                       TextStyle(color: kTextColor, fontSize: 22),
                //                 ),
                //               ),
                //             ),
                //           );
                //         }))
              ],
            ));
      },
    );
  }
}
