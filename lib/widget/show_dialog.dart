import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<dynamic> showCustomAlertDialog({
  required BuildContext context,
  required String title,
  required String message,
  required String defaultActionText,
  String? cancelTextAction,
}) async {
  if (Platform.isAndroid) {
    return showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(title: Text(title), content: Text(message), actions: [
        if (cancelTextAction != null)
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text(
              cancelTextAction,
            ),
          ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          child: Text(
            defaultActionText,
          ),
        )
      ]),
    );
  }
  return showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              if (cancelTextAction != null)
                CupertinoDialogAction(
                    child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Text(cancelTextAction),
                )),
              CupertinoDialogAction(
                  child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: Text(defaultActionText),
              ))
            ],
          ));
}
