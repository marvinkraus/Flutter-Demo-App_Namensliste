import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../entitity/personen.dart';

class addNewPersonPage extends StatelessWidget {
  addNewPersonPage({super.key});

  late String name;
  late int alter;
  late String picture;
  //late bedeutet dass zunächst kein Inhalt in Name gespeichert wird und das erst zur Laufzeit passiert

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(right: 10, left: 10, bottom: 10, top: 10),
        child: Column(children: [
          TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter your name',
            ),
            onChanged: ((value) {
              name = value;
            }),
          ),
          TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter your age',
            ),
            onChanged: ((value) {
              alter = int.parse(value);
            }),
          ),
          ElevatedButton(
              onPressed: (() {
                if (name.isNotEmpty) {
                  Person p = Person(name, alter, picture);
                  Navigator.of(context).pop(p);
                }
              }),
              child: const Text("Add Person"))
        ]),
      ),
    );
  }
}
