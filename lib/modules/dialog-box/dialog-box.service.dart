import 'package:flutter/material.dart';
import 'Widgets/dialog-box-notification.widget.dart';

class DialogBoxService {

  static final DialogBoxService _instance = DialogBoxService._internal();

  factory DialogBoxService() {
    return _instance;
  }

  DialogBoxService._internal();

    openDialogBoxNotification(BuildContext context, Widget content, Map<String, dynamic> response) {
    showDialog(
      context: context,
      builder: (innerContext) => DialogBoxNotification(
        outerContext: innerContext,
        content: content,
        response: response
      )
    );
  }

}