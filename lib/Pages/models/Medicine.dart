class Medicine {
  int? id;
  String? Medname;
  String? dose;
  String? time;
  String? Medtype;
  // bool? isfavourite;

  Medicine({
    this.id,
    required this.Medname,
    required this.dose,
    required this.time,
    required this.Medtype,
    // required this.isfavourite
  });

  Medicine.fromMap(Map map) {
    id = map['id'];
    Medname = map['medname'];
    dose = map['dose'];
    time = map['medtime'];
    Medtype = map['medtype'];
    // isfavourite = map['isfavourite'] == 1 true : false;
  }
  toMap() {
    return {
      "medname": Medname,
      "dose": dose,
      "medtime": time,
      "Medtype": Medtype,
      // "isfavourite": isfavourite ? 1 : 0
    };
  }
}
