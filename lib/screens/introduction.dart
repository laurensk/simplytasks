import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simplytasks/screens/home.dart';
import 'package:simplytasks/widgets/custom_scaffold.dart';

class Introduction extends StatefulWidget {
  final current;

  Introduction({this.current});

  @override
  _IntroductionState createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  int current = 0;

  final List<IntroductionScreen> screens = [
    IntroductionScreen(title: "1. Jahrgang", content: c),
    IntroductionScreen(title: "2. Jahrgang", content: java),
    IntroductionScreen(title: "Mehr Infos", content: more),
  ];

  @override
  void initState() {
    setState(() {
      current = widget.current;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    IntroductionScreen currentScreen = screens[current];
    return CustomScaffold(
      title: currentScreen.title,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(
                  width: double.infinity,
                  child: Card(
                    elevation: 3,
                    child: Padding(
                      padding: EdgeInsets.only(top: 30, left: 30, right: 30),
                      child: ListView(
                        children: [
                          currentScreen.content,
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8),
                child: Container(
                  height: 60,
                  child: SizedBox(
                    width: double.infinity,
                    child: GestureDetector(
                      onTap: () {
                        if (current == screens.length - 1) return goHome();
                        goToScreen(current + 1);
                      },
                      child: Card(
                        color: Colors.blue,
                        elevation: 3,
                        child: Center(
                          child: Text(
                            current == screens.length - 1
                                ? "Tour abschließen"
                                : "Weiter",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  goHome() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => Home(),
        ));
  }

  goToScreen(int index) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => Introduction(
          current: index,
        ),
      ),
    );
  }
}

class IntroductionScreen {
  String title;
  Widget content;

  IntroductionScreen({this.title, this.content});
}

final Widget c = Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(
      "Herzlich willkommen",
      style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
    ),
    Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Text(
          "Im ersten Jahrgang starten wir mit der Programmiersprache C. Ein wichtiger Aspekt ist, dass alle SchülerInnen auf den gleichen Wissensstand kommen."),
    ),
    Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Text("Beispiel",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17)),
    ),
    Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Text(
          "Erstelle ein Programm, welches zwei Zahlen einliest, sie addiert bzw. subtrahiert und die Ergebnisse ausgibt.\n\nErste Zahl eingeben: 21\nZweite Zahl eingeben: 5\nAddition: 21 + 5 = 26\nSubtraktion: 21 - 5 = 16"),
    ),
    Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Text("Lösung",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17)),
    ),
    Image.asset('assets/code_01.png')
  ],
);

final Widget java = Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(
      "Weiter geht's...",
      style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
    ),
    Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Text(
          "Im zweiten Jahrgang lernen wir Java und damit objektorientierte Programmierung. Wir schauen uns auch zum ersten Mal grafische Benutzeroberflächen an und entwickeln unsere ersten Spiele."),
    ),
    Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Text("Beispiel",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17)),
    ),
    Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Text(
          "Dieses Programm ist unsere eigene Implementation der bekannten 'Turtle Graphics'. Es geht darum, eine Schildkröte in einem Fenster korrekt zu bewegen. Außerdem lernen wir, wie man Buttons, Textfelder und mehr in Benutzeroberflächen einbauen kann."),
    ),
    Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 10),
      child: Text("Resultat",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17)),
    ),
    Image.asset('assets/code_02.png')
  ],
);

final Widget more = Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(
      "Vieles mehr!",
      style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
    ),
    Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Text(
          "In den höheren Jahrgängen erwarten euch viele weitere, spannende und interessante Themengebiete. Ein paar davon sind hier beschrieben."),
    ),
    Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Text("App-Entwicklung",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17)),
    ),
    Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Text(
          "Apps, genau wie diese hier, müssen auch entwickelt werden. Ab dem dritten Jahrgang beschäftigen wir uns mit der App-Entwicklung, speziell für Android-Geräte."),
    ),
    Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Text("Datenbanksysteme",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17)),
    ),
    Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Text(
          "Damit Apps und andere Programme Daten verwalten können, müssen diese auch in Datenbanken gespeichert werden. Ab dem dritten Jahrgang entwickeln wir unsere eigenen Datenbankstrukturen."),
    ),
    Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Text("IT-Sicherheit",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17)),
    ),
    Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 15),
      child: Text(
          "Zu jedem guten Softwareprodukt zählt die Sicherheit der eingesetzen Infrastuktur. In den höheren Jahrgängen beschäftigen wir uns ausführlich damit, unsere Programme vor Hacker-Angriffen zu schützen."),
    ),
  ],
);
