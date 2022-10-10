import 'package:flutter/material.dart';

import '../../constants/display.dart';
import '../d-button/button.dart';
import '../d-text/d_text.dart';
import 'dialog.dart';

showDYesNoDialog(
  BuildContext context, {
  required String title,
  required String message,
  Function()? yesPressed,
  Function()? noPressed,
}) {
  showDDiaLog(
    context,
    title: title,
    body: [
      DText.title(
          text: message,
          textType: DTextType.defaultText,
          textAlign: TextAlign.center),
    ],
    actions: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          DButton.textButton(
            text: 'Có',
            onPressed: yesPressed ??
                () {
                  Navigator.pop(context);
                },
            mainAlignment: MainAxisAlignment.end,
            textType: DTextType.defaultText,
            color: Colors.green,
          ),
          DButton.textButton(
            text: 'Không',
            onPressed: noPressed ??
                () {
                  Navigator.pop(context);
                },
            mainAlignment: MainAxisAlignment.end,
            textType: DTextType.defaultText,
            color: Colors.red,
          ),
        ],
      )
    ],
  );
}
