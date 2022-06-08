import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../entitity/personen.dart';

class StartPage extends StatelessWidget {
  StartPage({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
// ohne Unterstrich = Public Variable
// Mit Unterstrich = Private Variable

  List<String> personen = ["Klaus", "Gabi", "Hans"];
  List<Person> personenNew = [
    Person(name: "Klaus", alter: 12, picture: "Test")
  ];

  SnackBar mySnackBar() {
    return const SnackBar(
        content: Text("Ich wurde geklickt"),
        backgroundColor: Color.fromARGB(172, 204, 96, 43));
  }

// Dialog ist wie ein Alert
  myDialog(context) {
    showDialog(
        barrierDismissible: false, // Dialog Fenster nicht mehr wegklickbar
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Mein Dialog"),
            content: const Text("Hallo Welt"),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    print("ok");
                    Navigator.of(context).pop();
                  },
                  child: const Text("Ok")),
              ElevatedButton(
                  onPressed: () {
                    print("cancel");
                    Navigator.of(context).pop();
                    // lässt die Seite wieder verschwinden indem die Seite wie bei einem Stack weggenommen wird
                  },
                  child: const Text("cancel")),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 160, 156, 156),
      body: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: personenNew.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                          leading: const Icon(Icons.person_pin_sharp),
                          title: Text(personenNew[index].name),
                          subtitle: Text(personenNew[index].alter.toString()));
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  ElevatedButton(onPressed: null, child: Text("add")),
                  ElevatedButton(onPressed: null, child: Text("delete"))
                ],
              )
            ],
          )),
    );
  }
}
