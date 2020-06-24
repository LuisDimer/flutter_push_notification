import 'package:flutter/material.dart';
import 'package:flutterpushnotification/widgets/webview-template.widget.dart';
import 'package:url_launcher/url_launcher.dart';

class LauncherService {

  LauncherService._();

  static void launchWebView(BuildContext context, String title, String url) {
    final webview = (BuildContext context) => WebViewTemplate(title: title, url: url);
    final route = MaterialPageRoute(builder: webview);

    Navigator.of(context).push(route);
  }

  static Future<void> launchWebPage(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

}