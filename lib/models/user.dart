class User {
  late int id;
  late String name;
  late String email;
  late String password;
  late int mobile;
  late String gender;
  late String image;

  static const String tableName = 'users';

  User();

  ///Read row data from database table
  User.fromMap(Map<String, dynamic> rowMap) {
    id = rowMap['id'];
    name = rowMap['name'];
    email = rowMap['email'];
    password = rowMap['password'];
    gender = rowMap['gender'];
    image = rowMap['image'];
    mobile = rowMap['mobile'];
  }

  ///Prepare map to be saved in database
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['password'] = password;
    map['gender'] = gender;
    map['image'] = image;
    map['mobile'] = mobile;

    return map;
  }
}
