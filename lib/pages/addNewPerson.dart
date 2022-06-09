import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../entitity/personen.dart';

class addNewPersonPage extends StatelessWidget {
  addNewPersonPage({super.key});

  late String name;
  //late bedeutet dass zunächst kein Inhalt in Name gespeichert wird und das erst zur Laufzeit passiert

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(children: [
          TextField(
            onChanged: ((value) {
              name = value;
            }),
          ),
          ElevatedButton(
              onPressed: (() {
                if (name.isNotEmpty) {
                  Person p = Person(name: name, alter: 11, picture: "");
                  Navigator.of(context).pop(p);
                }
              }),
              child: const Text("Add Person"))
        ]),
      ),
    );
  }
}
