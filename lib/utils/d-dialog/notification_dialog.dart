import 'package:flutter/cupertino.dart';
import '../../constants/display.dart';
import '../d-button/button.dart';
import '../d-text/d_text.dart';
import 'dialog.dart';

void showDNotificationDialog(
  BuildContext context, {
  required String title,
  required String message,
  Function()? onPressed,
}) {
  // showCupertinoDialog(
  //     context: context,
  //     builder: (context) {
  //       return CupertinoAlertDialog(
  //         title: Text(title),
  //         content: Text(message),
  //         actions: [
  //           CupertinoDialogAction(
  //             onPressed: onPressed,
  //             child: Text('Ok'),
  //           )
  //         ],
  //       );
  //     });
  showDDiaLog(
    context,
    title: title,
    body: [
      DText.title(
        text: message,
        textType: DTextType.defaultText,
        textAlign: TextAlign.center,
        textOverflow: TextOverflow.visible,
      ),
    ],
    actions: [
      DButton.textButton(
        text: 'Đóng',
        textType: DTextType.defaultText,
        onPressed: onPressed ??
            () {
              Navigator.pop(context);
            },
        mainAlignment: MainAxisAlignment.end,
      )
    ],
  );
}
