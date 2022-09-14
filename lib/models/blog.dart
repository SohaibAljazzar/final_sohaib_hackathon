class Blog {
  late int id;
  late String name;
  late String info;
  late String image;

  static const String tableName = 'blogs';

  Blog();

  ///Read row data from database table
  Blog.fromMap(Map<String, dynamic> rowMap) {
    id = rowMap['id'];
    name = rowMap['name'];
    info = rowMap['info'];
    image = rowMap['image'];
  }

  ///Prepare map to be saved in database
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};
    map['name'] = name;
    map['image'] = image;
    map['info'] = info;

    return map;
  }
}
