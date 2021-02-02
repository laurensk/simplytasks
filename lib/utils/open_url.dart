import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:simplytasks/utils/alert_utils.dart';
import 'package:universal_html/html.dart' as html;
import 'package:url_launcher/url_launcher.dart';

class OpenUrl {
  static open(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: false, forceSafariVC: false);
    }
  }

  static downloadApp(BuildContext context) async {
    if (kIsWeb) {
      if (getAppUrl() != null) {
        open(getAppUrl());
      } else {
        AlertUtils.alert(context, "App herunterladen",
            "Öffne diese Webseite auf deinem Smartphone oder Tablet, um die App herunterzuladen.\nAlternativ kannst du auch im App Store nach 'Simplytasks' suchen.");
      }
    }
  }

  static String getAppUrl() {
    final String ios =
        "https://apps.apple.com/at/app/simplytasks-tot-2021/id1551673175";
    final String android =
        "https://play.google.com/store/apps/details?id=com.laurensk.simplytasks";

    String userAgent = html.window.navigator.userAgent.toString().toLowerCase();
    if (userAgent.contains("iphone") || userAgent.contains("ipad")) return ios;
    if (userAgent.contains("android")) return android;
    return null;
  }
}
