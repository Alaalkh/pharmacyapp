import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pharmacyapp/Pages/DetailsMed.dart';
import 'package:pharmacyapp/Pages/constants.dart';
import 'package:pharmacyapp/Pages/models/Medicine.dart';
import 'package:provider/provider.dart';

import '../Provider/Controller.dart';
import 'UpdateMed.dart';

class MedcinieList extends StatefulWidget {
  @override
  State<MedcinieList> createState() => _MedcinieListState();
}

class _MedcinieListState extends State<MedcinieList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<DbController>(builder: (context, controller, x) {
        return ListView.builder(
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
                                Medname: controller.medicine[index].Medname,
                                dose: controller.medicine[index].dose,
                                time: controller.medicine[index].time,
                                Medtype: controller.medicine[index].Medtype,
                              )));
                },
                child: Card(
                  shadowColor: Colors.grey,
                  color: index % 2 == 0 ? kotherColor : kPrimaryColor,
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                      side: BorderSide(
                          color: kScaffoldCelor, style: BorderStyle.solid)),
                  child: ListTile(
                    trailing: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UpdateMed(
                                      id: controller.medicine[index].id,
                                      Medname:
                                          controller.medicine[index].Medname,
                                      dose: controller.medicine[index].dose,
                                      time: controller.medicine[index].time,
                                      Medtype:
                                          controller.medicine[index].Medtype,
                                    )));
                      },
                      icon: Icon(Icons.edit),
                      color: kTextColor,
                    ),
                    leading: IconButton(
                      onPressed: () {
                        controller
                            .deleteMedicine(controller.medicine[index].id!);
                      },
                      icon: Icon(Icons.delete_forever),
                      color: kTextColor,
                    ),
                    title: Text(
                      controller.medicine[index].Medname.toString(),
                      style: TextStyle(color: kTextColor, fontSize: 22),
                    ),
                    subtitle: Text(controller.medicine[index].time.toString(),
                        style: TextStyle(color: kTextColor)),
                  ),
                ),
              );
            });
      }),
    );
  }
}
