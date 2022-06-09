import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_demo/pages/addNewPerson.dart';
import 'package:flutter_demo/pages/start.dart';

class MyRouter {
  static Route<dynamic> routes(RouteSettings rs) {
    switch (rs.name) {
      case '/start':
        {
          return MaterialPageRoute(builder: (context) => StartPage());
        }

      case '/addNewPerson': //interne URL also nicht entscheidend dass es gleich ist zum Namen der Page
        {
          return MaterialPageRoute(builder: (context) => addNewPersonPage());
          ;
        }
      default:
        {
          return MaterialPageRoute(builder: (context) => StartPage());
        }
    }
  }
}
