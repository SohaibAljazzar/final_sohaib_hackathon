class Ad {
  late int id;
  late String name;
  late String date;
  late String startHoure;
  late String info;
  late int houre;
  late String address;
  late String company;
  late String path;
  late String image;

  static const String tableName = 'ads';

  Ad();

  ///Read row data from database table
  Ad.fromMap(Map<String, dynamic> rowMap) {
    id = rowMap['id'];
    name = rowMap['name'];
    date = rowMap['date'];
    startHoure = rowMap['start_houre'];
    info = rowMap['info'];
    houre = rowMap['houre'];
    address = rowMap['address'];
    company = rowMap['company'];
    image = rowMap['image'];
    path = rowMap['path'];
  }

  ///Prepare map to be saved in database
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};
    map['name'] = name;
    map['date'] = date;
    map['start_houre'] = startHoure;
    map['info'] = info;
    map['houre'] = houre;
    map['address'] = address;
    map['company'] = company;
    map['image'] = image;
    map['path'] = path;

    return map;
  }
}
