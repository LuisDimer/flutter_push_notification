import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpushnotification/ui/colors.ui.dart';
import 'package:webview_flutter/webview_flutter.dart';


class WebViewTemplate extends StatelessWidget {

  final String title;
  final String url;

  WebViewTemplate({
    @required this.title,
    @required this.url
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: UIColors.RED_TALL_POPPY,
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}