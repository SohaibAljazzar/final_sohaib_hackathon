class Admin {
  late String name;
  late String email;

  static const String tableName = 'admin';

  Admin();

  ///Read row data from database table
  Admin.fromMap(Map<String, dynamic> rowMap) {
    name = rowMap['name'];
    email = rowMap['email'];
  }

  ///Prepare map to be saved in database
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;

    return map;
  }
}
