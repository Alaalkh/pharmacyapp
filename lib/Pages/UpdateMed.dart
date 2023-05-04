import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmacyapp/Pages/constants.dart';
import 'package:pharmacyapp/Pages/models/Convrt_time.dart';
import 'package:pharmacyapp/Pages/models/medicine_type.dart';
import 'package:sizer/sizer.dart';

class UpdateMed extends StatefulWidget {
  const UpdateMed({super.key});

  @override
  State<UpdateMed> createState() => _UpdateMedState();
}

class _UpdateMedState extends State<UpdateMed> {
  late TextEditingController nameController;
  late TextEditingController dosageController;
  late GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    dosageController.dispose();
  }

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    dosageController = TextEditingController();
    _scaffoldKey = GlobalKey<ScaffoldState>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          "Update Medicine",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Panetilte(
            title: "Medicine Name",
            isRequired: true,
          ),
          TextFormField(
            controller: nameController,
            textCapitalization: TextCapitalization.words,
            maxLength: 12,
            decoration: InputDecoration(border: UnderlineInputBorder()),
            style: TextStyle(fontSize: 12.sp, color: Color(0xFF564850))
                .copyWith(color: kotherColor),
          ),
          Panetilte(
            title: "Dosage in mg",
            isRequired: true,
          ),
          TextFormField(
            controller: dosageController,
            keyboardType: TextInputType.number,
            maxLength: 12,
            decoration: InputDecoration(border: UnderlineInputBorder()),
            style: TextStyle(fontSize: 12.sp, color: Color(0xFF564850))
                .copyWith(color: kotherColor),
          ),
          SizedBox(
            height: 2.h,
          ),
          const Panetilte(title: "Mediciene Type", isRequired: false),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: StreamBuilder(builder: (context, snapshot) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MedicineType(
                      medicineType: Medicine.bottle,
                      name: "Bottlee",
                      iconValue: 'images/bottle.svg',
                      IsSelected:
                          snapshot.data == Medicine.bottle ? true : false),
                  MedicineType(
                      medicineType: Medicine.pill,
                      name: "Pill",
                      iconValue: 'images/pill.svg',
                      IsSelected:
                          snapshot.data == Medicine.pill ? true : false),
                  MedicineType(
                      medicineType: Medicine.syringe,
                      name: "Syringe",
                      iconValue: 'images/syringe.svg',
                      IsSelected:
                          snapshot.data == Medicine.syringe ? true : false),
                  MedicineType(
                      medicineType: Medicine.tablet,
                      name: "Tablet",
                      iconValue: 'images/tablet.svg',
                      IsSelected:
                          snapshot.data == Medicine.tablet ? true : false)
                ],
              );
            }),
          ),
          const Panetilte(title: "Starting Time", isRequired: true),
          const SelectTime(),
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
                    child: Text("Update",
                        style:
                            TextStyle(fontSize: 12.sp, color: Color(0xFF564850))
                                .copyWith(color: kScaffoldCelor)),
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          )
        ],
      ),
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
                .copyWith(color: kPrimaryColor))
      ])),
    );
  }
}

class MedicineType extends StatelessWidget {
  const MedicineType(
      {super.key,
      required this.medicineType,
      required this.name,
      required this.iconValue,
      required this.IsSelected});
  final Medicine medicineType;
  final String name;
  final String iconValue;
  final bool IsSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Container(
            width: 20.w,
            height: 10.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.h),
                color: IsSelected ? kotherColor : Colors.white),
            child: Padding(
              padding: EdgeInsets.only(top: 1.h, bottom: 1.h),
              child: SvgPicture.asset(
                iconValue,
                height: 7.h,
                color: IsSelected ? Colors.white : kotherColor,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 1.h),
            child: Container(
              width: 20.w,
              height: 4.h,
              child: Center(
                child: Text(
                  name,
                  style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                          color: kTextColor)
                      .copyWith(color: IsSelected ? Colors.white : kotherColor),
                ),
              ),
              decoration: BoxDecoration(
                  color: IsSelected ? kotherColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(20)),
            ),
          ),
        ],
      ),
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
// class SelectDate extends StatefulWidget {
//   const SelectDate({super.key});

//   @override
//   State<SelectDate> createState() => _SelectDateState();
// }

// class _SelectDateState extends State<SelectDate> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
