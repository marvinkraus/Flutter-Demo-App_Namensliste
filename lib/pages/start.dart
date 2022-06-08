import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class StartPage extends StatelessWidget {
  StartPage({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
// ohne Unterstrich = Public Variable
// Mit Unterstrich = Private Variable

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
      backgroundColor: Color.fromARGB(255, 59, 24, 24),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Center(
          child: Container(
            height: 256,
            width: 256,
            decoration: BoxDecoration(
                border: Border.all(width: 3),
                color: Color.fromARGB(173, 143, 141, 140)),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    // sehr mächtiges Tool um Text anklickbar zu machen
                    onTap: () {
                      myDialog(context);
                    },
                    child: const Text("Ich will auch geklickt werden"),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        print("Button wurde geklickt");
                        ScaffoldMessenger.of(context)
                            .showSnackBar(mySnackBar());
                      },
                      child: const Text("Klick mich")),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(label: "test", icon: Icon(Icons.audiotrack)),
        BottomNavigationBarItem(label: "test", icon: Icon(Icons.work)),
        BottomNavigationBarItem(label: "test", icon: Icon(Icons.video_label))
      ]),
    );
  }
}
