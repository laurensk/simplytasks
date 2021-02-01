import 'package:flutter/material.dart';

class AlertUtils {
  static resetConfirmation(BuildContext context, Function callback) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Liste leeren'),
          content: Text('Bist du sicher, dass du die Liste leeren möchtest?'),
          actions: <Widget>[
            TextButton(
              child: Text('Liste leeren'),
              onPressed: () {
                Navigator.of(context).pop();
                callback(true);
              },
            ),
            TextButton(
              child: Text('Abbrechen'),
              onPressed: () {
                Navigator.of(context).pop();
                callback(false);
              },
            ),
          ],
        );
      },
    );
  }

  static alert(BuildContext context, String title, String message) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
