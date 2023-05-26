import 'package:flutter/material.dart';
import 'package:pharmacyapp/Pages/UpdateMed.dart';

import 'package:pharmacyapp/Pages/models/Medicine.dart';
import 'package:pharmacyapp/Pages/newMed.dart';
import 'package:pharmacyapp/Sqflite/Dbhelper.dart';

class DbController extends ChangeNotifier {
  DbController() {
    getAllMedicine();
    notifyListeners();
  }

  List<Medicine> medicine = [];
  bool isLoading = false;
  flipIsLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  getAllMedicine() async {
    flipIsLoading();
    medicine = await DbHelper.dbHelper.getAllmedicine();
    flipIsLoading();
    notifyListeners();
  }

  getAllMedicinebyid(int id) async {
    flipIsLoading();
    medicine = (await DbHelper.dbHelper.getmedicineById(id)) as List<Medicine>;
    flipIsLoading();
  }

  late TextEditingController nameController = TextEditingController();
  late TextEditingController doseController = TextEditingController();
  late TextEditingController timeController = TextEditingController();
  late TextEditingController typeController = TextEditingController();

  insertNewMedicine(Medicine medicine) async {
    Medicine med = Medicine(
      Medname: nameController.text,
      dose: doseController.text,
      time: timeController.text,
      Medtype: typeController.text,
    );
    await DbHelper.dbHelper.insertNewMedcinie(medicine);
    getAllMedicine();
    notifyListeners();
  }

  updateData(String sql) async {
    await DbHelper.dbHelper.updateData(sql);
    getAllMedicine();
    notifyListeners();
  }

  deleteMedicine(int id) async {
    await DbHelper.dbHelper.deletemedicine(id);
    medicine.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
