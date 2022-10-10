import 'package:dcore/constants/colors.dart';
import 'package:dcore/constants/display.dart';
import 'package:flutter/material.dart';
import '../d-text/d_text.dart';

void showDDiaLog(
  BuildContext context, {
  List<Widget>? body,
  List<Widget>? actions,
  required String title,
}) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          elevation: 0,
          actionsPadding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
          contentPadding: const EdgeInsets.all(10),
          titlePadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          buttonPadding: const EdgeInsets.all(10),
          insetPadding:
              const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          title: DText.title(
            text: title,
            textType: DTextType.subTitle,
            color: DColorType.themeColor,
            textAlign: TextAlign.center,
          ),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView(
              shrinkWrap: true,
              children: body!,
            ),
          ),
          actions: actions,
        );
      });
}
