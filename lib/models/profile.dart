class Profile {
  late int id;
  late String facebook;
  late String linkedin;
  late String twitter;
  late String upwork;
  late String freelance;
  late String mostaql;
  late String kamcat;
  late String name;
  late String info;
  late String path;
  late String image;
  late int freelancerId;

  static const String tableName = 'ads';

  Profile();

  ///Read row data from database table
  Profile.fromMap(Map<String, dynamic> rowMap) {
    id = rowMap['id'];
    facebook = rowMap['facebook'];
    linkedin = rowMap['linkedin'];
    twitter = rowMap['twitter'];
    upwork = rowMap['upwork'];
    freelance = rowMap['freelance'];
    mostaql = rowMap['mostaql'];
    kamcat = rowMap['kamcat'];
    name = rowMap['name'];
    info = rowMap['info'];
    image = rowMap['image'];
    path = rowMap['path'];
    freelancerId = rowMap['freelancer_id'];
  }

  ///Prepare map to be saved in database
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};
    map['name'] = name;
    map['facebook'] = facebook;
    map['linkedin'] = linkedin;
    map['info'] = info;
    map['twitter'] = twitter;
    map['upwork'] = upwork;
    map['freelance'] = freelance;
    map['kamcat'] = kamcat;
    map['mostaql'] = mostaql;
    map['freelancer_id'] = freelancerId;
    map['image'] = image;
    map['path'] = path;

    return map;
  }
}
