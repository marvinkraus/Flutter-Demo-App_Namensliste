import 'package:flutter/material.dart';
import 'package:flutter_demo/pages/addNewPerson.dart';
import 'package:url_launcher/url_launcher.dart';

import '../entitity/personen.dart';

class StartPage extends StatefulWidget {
  StartPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _StartPage();
  }
}

//StatefulWidget für Veränderungen an den Pages
class _StartPage extends State<StartPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
// ohne Unterstrich = Public Variable
// Mit Unterstrich = Private Variable

  List<String> personen = ["Klaus", "Gabi", "Hans"];
  List<Person> personenListe = [
    Person(name: "Klaus", alter: 12, picture: "Test"),
    Person(name: "Klaus", alter: 12, picture: "Test"),
    Person(name: "Klaus", alter: 12, picture: "Test"),
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

  int indexSelected = -1;
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
                    itemCount: personenListe.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                          onTap: () {
                            if (indexSelected != index) {
                              indexSelected = index;
                            } else {
                              indexSelected = -1;
                            }
                            setState(() {});
                          },
                          child: ListTile(
                              tileColor: indexSelected == index
                                  ? Colors.red
                                  : Colors.transparent,
                              leading: const Icon(Icons.person_pin_sharp),
                              title: Text(personenListe[index].name),
                              subtitle:
                                  Text(personenListe[index].alter.toString())));
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        Person p = await Navigator.of(context)
                            .pushNamed('/addNewPerson') as Person;
                        personenListe.add(p);
                        setState(() {});
                      },
                      child: const Text("add")),
                  ElevatedButton(
                      onPressed: () {
                        if (indexSelected == -1) {
                          print("Fehler nichts ausgewählt");
                        }
                        personenListe.removeAt(indexSelected);
                        setState(() {});
                      },
                      child: const Text("delete")),
                ],
              )
            ],
          )),
    );
  }
}
