class Freelancer {
  late int id;
  late String name;
  late String email;
  late String password;
  late int mobile;
  late String gender;
  late String image;
  late String skill;
  late String experiance;

  static const String tableName = 'freelancers';

  Freelancer();

  ///Read row data from database table
  Freelancer.fromMap(Map<String, dynamic> rowMap) {
    id = rowMap['id'];
    name = rowMap['name'];
    email = rowMap['email'];
    password = rowMap['password'];
    gender = rowMap['gender'];
    image = rowMap['image'];
    mobile = rowMap['mobile'];
    skill = rowMap['skill'];
    experiance = rowMap['experiance'];
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
    map['skill'] = skill;
    map['experiance'] = experiance;

    return map;
  }
}
