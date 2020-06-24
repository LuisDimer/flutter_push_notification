import 'package:flutter/material.dart';
import 'package:flutterpushnotification/services/Launcher.service.dart';
import 'package:flutterpushnotification/ui/colors.ui.dart';

class DialogBoxNotification extends StatelessWidget {

  final Widget content;
  final BuildContext outerContext;
  final Map<String, dynamic> response;

  DialogBoxNotification({
    @required this.content,
    @required this.outerContext,
    @required this.response,
  });

  @override
  Widget build(BuildContext context) {
    final viewSize = MediaQuery.of(context).size;
    final width = viewSize.width * 0.9;
    final height = viewSize.height * 0.4;

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end, 
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  content,
                ],
              ),
            ),
            _actions()
          ],
        )
      ),
    );
  }

  Widget _actions({ BuildContext context }) {
    final title = response['notification']['title'];
    final link = response['data']['url'];

    if(response['data']['url'] != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FlatButton(
            child: Text(
              'Abrir',
              style: TextStyle(
                color: UIColors.GREEN_ATOLL
              ),
            ), 
            onPressed: () {
              Navigator.of(outerContext).pop();
              LauncherService.launchWebView(outerContext, title, link);
            },
          ),
          FlatButton(
            child: Text(
              'Voltar',
              style: TextStyle(
                color: UIColors.GREEN_ATOLL
              ),
            ),
            onPressed: () {
              Navigator.pop(outerContext);
            },
          ),
        ],
      );
    }
    else {
      return FlatButton(
        onPressed: () {
          Navigator.pop(outerContext);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              'Voltar',
              style: TextStyle(
                color: UIColors.GREEN_ATOLL
              ),
            ),
          ],
        ),
      );
    }
  } 
}