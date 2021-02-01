import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ButtonGroup extends StatelessWidget {
  final List<String> titles;
  final List<Function> functions;

  ButtonGroup({this.titles, this.functions});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(top: 30, left: 20, right: 20),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Card(
                    elevation: 3,
                    child: ListTile(
                      onTap: () {
                        functions[0]();
                      },
                      title: Text(
                        titles[0],
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Card(
                    elevation: 3,
                    child: ListTile(
                      onTap: () {
                        functions[1]();
                      },
                      title: Text(
                        titles[1],
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                if (kIsWeb)
                  Expanded(
                    flex: 1,
                    child: Card(
                      elevation: 3,
                      child: ListTile(
                        onTap: () {
                          functions[2]();
                        },
                        title: Text(
                          titles[2],
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                Expanded(
                  flex: 1,
                  child: Card(
                    elevation: 3,
                    child: ListTile(
                      onTap: () {
                        functions[3]();
                      },
                      title: Text(
                        titles[3],
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
