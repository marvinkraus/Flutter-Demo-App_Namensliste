// ignore: camel_case_types
import 'dart:convert';

class Person {
  String name;
  int alter;
  String picture;

  Person(this.name, this.alter, this.picture);

  String toJson() {
    Map<String, dynamic> map = {};
    map['name'] = name;
    map['alter'] = alter;
    map['picture'] = picture;
    return jsonEncode(map);
  }

  static Person fromJson(String json) {
    Map<String, dynamic> map = jsonDecode(json);
    return Person(
        "${map['firstname']} ${map['lastname']}", map['age'], map['image']);
  }
}
