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

  List<IntroductionScreen> screens = [
    IntroductionScreen(
        title: "1. Jahrgang",
        card1: Text("wir machen c"),
        card2: Text("ja, wirklich"),
        card3: Text("noch immer!")),
    IntroductionScreen(title: "2. Jahrgang", card1: Text("wir machen java")),
    IntroductionScreen(title: "Mehr Infos", card1: Text("wir machen mehr")),
  ];

  final controller = PageController(initialPage: 0);

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
                      child: PageView(
                        controller: controller,
                        children: [
                          currentScreen.card1,
                          currentScreen.card2,
                          currentScreen.card3
                        ],
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
  Widget card1;
  Widget card2;
  Widget card3;

  IntroductionScreen({this.title, this.card1, this.card2, this.card3});
}
