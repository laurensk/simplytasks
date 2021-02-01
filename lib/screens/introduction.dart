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
                      padding: const EdgeInsets.all(30),
                      child: SingleChildScrollView(
                        child: currentScreen.content,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
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
          "Im ersten Jahrgang starten wir mit der Programmiersprache C. Ein sehr wichtiger Punkt im ersten Jahrgang ist, dass alle Schülerinnen und Schüler auf den gleichen Wissensstand kommen."),
    ),
    Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Text("Beispiel",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17)),
    )
  ],
);

final Widget java = Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(
      "Weiter gehts...",
      style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
    ),
    Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Text(
          "Im ersten Jahrgang starten wir mit der Programmiersprache C. Ein sehr wichtiger Punkt im ersten Jahrgang ist, dass alle Schülerinnen und Schüler auf den gleichen Wissensstand kommen."),
    ),
    Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Text("Beispiel",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17)),
    )
  ],
);

final Widget more = Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(
      "Noch mehr!",
      style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
    ),
    Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Text(
          "Im ersten Jahrgang starten wir mit der Programmiersprache C. Ein sehr wichtiger Punkt im ersten Jahrgang ist, dass alle Schülerinnen und Schüler auf den gleichen Wissensstand kommen."),
    ),
    Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Text("Beispiel",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17)),
    )
  ],
);
