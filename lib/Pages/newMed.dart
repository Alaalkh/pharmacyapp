import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmacyapp/Pages/HomeBottomNavigation.dart';
import 'package:pharmacyapp/Pages/constants.dart';
import 'package:pharmacyapp/Pages/models/Convrt_time.dart';
import 'package:pharmacyapp/Pages/models/Medicine.dart';
import 'package:pharmacyapp/Pages/models/medicine_type.dart';
import 'package:pharmacyapp/Provider/Controller.dart';
import 'package:pharmacyapp/Sqflite/Dbhelper.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class NewMedPage extends StatefulWidget {
  const NewMedPage({super.key});

  @override
  State<NewMedPage> createState() => _NewMedPageState();
}

class _NewMedPageState extends State<NewMedPage> {
  late TextEditingController nameController;
  late TextEditingController dosageController;
  late TextEditingController timeController;
  late TextEditingController typeController;
  late GlobalKey<ScaffoldState> _scaffoldKey;

  List<String> dropitems = ["Pill", "Bottle", "Syringe", "Tablet"];
  String dropvalue = "Pill";
  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    dosageController.dispose();
    timeController.dispose();
    typeController.dispose();
  }

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    dosageController = TextEditingController();
    timeController = TextEditingController();
    typeController = TextEditingController();
    _scaffoldKey = GlobalKey<ScaffoldState>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          "Add New",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Consumer<DbController>(builder: (context, controller, x) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Panetilte(
              title: "Medicine Name",
              isRequired: true,
            ),
            SizedBox(
              height: 9,
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: TextFormField(
                controller: nameController,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                    fillColor: kotherColor,
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: kotherColor, width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    border: const OutlineInputBorder(),
                    floatingLabelStyle: TextStyle(color: kTextColor),
                    labelStyle: TextStyle(color: kTextColor)),
                style: TextStyle(fontSize: 12.sp, color: Color(0xFF564850))
                    .copyWith(color: kotherColor),
              ),
            ),
            Panetilte(
              title: "Dosage in mg",
              isRequired: true,
            ),
            SizedBox(
              height: 9,
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: TextFormField(
                controller: dosageController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    fillColor: kotherColor,
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: kotherColor, width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    border: const OutlineInputBorder(),
                    floatingLabelStyle: TextStyle(color: kTextColor),
                    labelStyle: TextStyle(color: kTextColor)),
                style: TextStyle(fontSize: 12.sp, color: Color(0xFF564850))
                    .copyWith(color: kotherColor),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            const Panetilte(title: "Mediciene Type", isRequired: false),
            SizedBox(
              height: 9,
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: TextFormField(
                controller: typeController,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                    fillColor: kotherColor,
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: kotherColor, width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    border: const OutlineInputBorder(),
                    floatingLabelStyle: TextStyle(color: kTextColor),
                    labelStyle: TextStyle(color: kTextColor)),
                style: TextStyle(fontSize: 12.sp, color: Color(0xFF564850))
                    .copyWith(color: kotherColor),
              ),
            ),
            const Panetilte(title: "Starting Time", isRequired: true),
            SizedBox(
              height: 9,
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: TextFormField(
                onTap: () {
                  TimeOfDay _time = const TimeOfDay(hour: 0, minute: 00);
                  showTimePicker(context: context, initialTime: _time)
                      .then((value) {
                    timeController.text = value!.format(context).toString();
                  });
                },
                controller: timeController,
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                    fillColor: kotherColor,
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: kotherColor, width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    border: const OutlineInputBorder(),
                    labelText: 'At ',
                    floatingLabelStyle: TextStyle(color: kTextColor),
                    labelStyle: TextStyle(color: kTextColor)),
                style: TextStyle(fontSize: 12.sp, color: Color(0xFF564850))
                    .copyWith(color: kotherColor),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(left: 8.w, right: 8.w),
                child: SizedBox(
                  width: double.infinity,
                  height: 8.h,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      shape: const StadiumBorder(),
                    ),
                    child: Center(
                      child: Text("Confirm",
                          style: TextStyle(
                                  fontSize: 12.sp, color: Color(0xFF564850))
                              .copyWith(color: kScaffoldCelor)),
                    ),
                    onPressed: () async {
                      await controller.insertNewMedicine(Medicine(
                          Medname: nameController.text,
                          dose: dosageController.text,
                          time: timeController.text,
                          Medtype: typeController.text));
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Added Medcinie Successfully"),
                      ));
                      Navigator.pop(context);
                      ;
                    },
                  ),
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}

class Panetilte extends StatelessWidget {
  const Panetilte({super.key, required this.title, required this.isRequired});
  final String title;
  final bool isRequired;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 2.h),
      child: Text.rich(TextSpan(children: <TextSpan>[
        TextSpan(
            text: title,
            style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
                color: kTextColor)),
        TextSpan(
            text: (isRequired ? "*" : ""),
            style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                    color: kTextColor)
                .copyWith(color: kErrorBorderColor))
      ])),
    );
  }
}

class SelectTime extends StatefulWidget {
  const SelectTime({super.key});

  @override
  State<SelectTime> createState() => _SelectTimeState();
}

class _SelectTimeState extends State<SelectTime> {
  TimeOfDay _time = const TimeOfDay(hour: 0, minute: 00);
  bool _clicked = false;

  Future<TimeOfDay> _selectTime() async {
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: _time);
    if (picked != null && picked != _time) {
      setState(() {
        _time = picked;
        _clicked = true;
      });
    }
    return picked!;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 8.h,
      child: Padding(
        padding: EdgeInsets.only(top: 2.h),
        child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: kPrimaryColor, shape: const StadiumBorder()),
          onPressed: () {
            _selectTime();
          },
          child: Center(
            child: Text(
                _clicked == false
                    ? "Select Time"
                    : "${convertTime(_time.hour.toString())}:${convertTime(_time.minute.toString())}",
                style: TextStyle(fontSize: 12.sp, color: Color(0xFF564850))
                    .copyWith(color: kScaffoldCelor)),
          ),
        ),
      ),
    );
  }
}
