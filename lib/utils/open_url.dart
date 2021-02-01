import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:simplytasks/utils/alert_utils.dart';
import 'package:universal_html/html.dart' as html;
import 'package:url_launcher/url_launcher.dart';

class OpenUrl {
  static open(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  static downloadApp(BuildContext context) async {
    if (kIsWeb) {
      if (getAppUrl() != null) {
        AlertUtils.alert(context, "You need to HOLD ON!", getAppUrl());
      } else {
        AlertUtils.alert(context, "App herunterladen",
            "Öffne diese Webseite auf deinem Smartphone oder Tablet, um die App herunterzuladen.\nAlternativ kannst du auch im App Store nach 'Simplytasks' suchen.");
      }
    }
  }

  static String getAppUrl() {
    final String ios = "ios";
    final String android = "android";

    String userAgent = html.window.navigator.userAgent.toString().toLowerCase();
    if (userAgent.contains("iphone") || userAgent.contains("ipad")) return ios;
    if (userAgent.contains("android")) return android;
    return null;
  }
}
