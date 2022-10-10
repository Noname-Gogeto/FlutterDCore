// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:dcore/constants/display.dart';

enum TextType { title, titleAndText, iconText }

class DText extends StatelessWidget {
  final String? text;
  final String? title;
  final DTextType? textType;
  final Color? color;
  final Color? backgroundColor;
  final IconData? icon;
  final bool? underline;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? textOverflow;
  final double? width;

  final TextType type;
  const DText.title({
    super.key,
    required this.text,
    this.textType = DTextType.title,
    this.color,
    this.textAlign,
    this.backgroundColor,
    this.textOverflow = TextOverflow.ellipsis,
  })  : assert(text != null, 'Text cannot be null'),
        title = null,
        underline = false,
        maxLines = null,
        icon = null,
        width = null,
        type = TextType.title;

  const DText.titleAndText({
    super.key,
    required this.text,
    required this.title,
    this.textType = DTextType.defaultText,
    this.color,
    this.textOverflow = TextOverflow.ellipsis,
    this.width,
    this.underline = false,
  })  : assert(
            text != null && title != null, 'Text and title must not be null'),
        maxLines = null,
        backgroundColor = null,
        icon = null,
        textAlign = null,
        type = TextType.titleAndText;

  const DText.iconText({
    super.key,
    required this.text,
    required this.icon,
    this.textType = DTextType.defaultText,
    this.color,
    this.textAlign,
    this.maxLines = 1,
    this.width,
    this.textOverflow,
  })  : assert(text != null && icon != null, 'Text and icon must not be null'),
        title = null,
        backgroundColor = null,
        underline = false,
        type = TextType.iconText;

  @override
  Widget build(BuildContext context) {
    Widget textTmp = Text(
      text!,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: textOverflow,
      softWrap: true,
      style: TextStyle(
        color: color ?? Colors.black,
        backgroundColor: backgroundColor ?? Colors.transparent,
        fontSize: getFontSize(fontSizeType: textType!),
        fontWeight: getFontWeight(fontWeightType: textType!),
      ),
    );
    Widget result = textTmp;
    if (type == TextType.iconText) {
      result = Container(
        margin: const EdgeInsets.only(bottom: 5),
        width: width ?? MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(icon!, color: color ?? Colors.black, size: 17),
            const SizedBox(width: 3),
            textTmp,
          ],
        ),
      );
    }

    if (type == TextType.titleAndText) {
      result = Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.only(bottom: 5),
        width: width ?? MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color:
                  underline == true ? Colors.grey.shade200 : Colors.transparent,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(title!,
                style: TextStyle(
                  color: color ?? Colors.black,
                  fontSize: getFontSize(fontSizeType: DTextType.title),
                  fontWeight: getFontWeight(fontWeightType: DTextType.title),
                )),
            textTmp,
          ],
        ),
      );
    }

    return result;
  }
}
