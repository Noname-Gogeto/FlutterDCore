// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dcore/constants/colors.dart';
import 'package:dcore/constants/display.dart';
import 'package:dcore/utils/d-text/d_text.dart';
import 'package:flutter/material.dart';

enum CheckBoxType { normal, item }

class DCheckBox extends StatelessWidget {
  final String? title;
  final Function(bool?)? onPressed;
  final bool? currentValue;

  final CheckBoxType? type;

  const DCheckBox({
    Key? key,
    required this.title,
    this.onPressed,
    this.currentValue,
  })  : type = CheckBoxType.normal,
        super(key: key);

  const DCheckBox.items({
    Key? key,
    required this.title,
    this.onPressed,
    this.currentValue,
  })  : type = CheckBoxType.item,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget? result;

    if (type == CheckBoxType.normal) {
      result = Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            width: 25,
            height: 25,
            child: Checkbox(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              value: currentValue,
              onChanged: onPressed,
              activeColor: DColorType.themeColor,
              side: const BorderSide(color: DColorType.themeColor),
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(DDecorationType.defaultRadius),
              ),
            ),
          ),
          DText.title(
            text: title!,
            textType: DTextType.defaultText,
            color: DColorType.themeColor,
          ),
        ],
      );
    }

    if (type == CheckBoxType.item) {
      result = CheckboxListTile(
        contentPadding: EdgeInsets.zero,
        title: DText.title(text: title, textType: DTextType.subTitle),
        value: currentValue,
        onChanged: onPressed ?? (value) {},
        controlAffinity: ListTileControlAffinity.leading,
        activeColor: DColorType.themeColor,
        side: const BorderSide(color: DColorType.themeColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        checkboxShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DDecorationType.defaultRadius),
        ),
      );
    }

    return result!;
  }
}
