import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmacyapp/Pages/models/Medicine.dart';
import 'package:sqflite/sqflite.dart';

import '../Pages/newMed.dart';

class DbHelper {
  DbHelper._();
  static DbHelper dbHelper = DbHelper._();
  late Database database;
  initDatabase() async {
    String appPath = await getDatabasesPath();
    String dbPath = appPath + '/project.db';
    database = await openDatabase(dbPath, version: 1, onCreate: (db, v) {
      db.execute(
          'CREATE TABLE medicine (id INTEGER PRIMARY KEY AUTOINCREMENT, medname TEXT, dose TEXT, medtime TEXT,medtype TEXT,isfavourite INTEGER)');
    });
    print("created ");
  }

  insertNewMedcinie(Medicine medicine) async {
    try {
      int rowNumber = await database.insert('medicine', medicine.toMap());
      log(rowNumber.toString());
      getAllmedicine();
    } catch (e) {
      log("row has not been inserted");
    }
  }

  Future<List<Medicine>> getAllmedicine() async {
    await Future.delayed(const Duration(seconds: 1));
    List<Map> results = await database.query('medicine');
    List<Medicine> medcinie = results.map((e) => Medicine.fromMap(e)).toList();
    print(results);
    return medcinie;
  }

  Future<Medicine> getmedicineById(int id) async {
    List<Map> results = await database.query('medicine', where: 'id=$id');
    return Medicine.fromMap(results.first);
  }

  deletemedicine(int id) async {
    await database.delete('medicine', where: 'id=$id');
  }

  Future<int> updateData(String sql) async {
    Database? mydb = await database;
    int reponse = await mydb.rawUpdate(sql);
    getAllmedicine();

    return reponse;
  }

  // Updatetofav(Medicine medicine) {
  //   database.update('medicine', {'isfavourite': !medicine.isfavourite ? 1 : 0},where: 'id=$id');
  // }

  Future<List<Medicine>> searchContacts(String keyword) async {
    final db = await database;
    List<Map<String, dynamic>> allRows = await db
        .query('medicine', where: 'medname LIKE ?', whereArgs: ['%$keyword%']);
    List<Medicine> medcinie =
        allRows.map((medcinie) => Medicine.fromMap(medcinie)).toList();
    return medcinie;
  }

//   Future<Medicine> getStudentById(int id) async {
//     List<Map> results = await database.query('medicine', where: 'id=$id');
//     return Medicine.fromMap(results.first);
//   }
// }
}
