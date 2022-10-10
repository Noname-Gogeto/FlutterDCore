import 'package:dcore/constants/display.dart';
import 'package:dcore/utils/d-text/d_text.dart';
import 'package:flutter/material.dart';
import 'package:dcore/constants/colors.dart';

enum ButtonType { roundButton, textButton, iconButton }

class DButton extends StatelessWidget {
  final String? text;
  final DButtonType? buttonColorType;
  final DTextType? textType;
  final Function()? onPressed;
  final double? radius;
  final EdgeInsetsGeometry? padding;
  final bool? styled;
  final IconData? icon;
  final String? tooltip;
  final double? iconSize;
  final Color? color;
  final MainAxisAlignment? mainAlignment;
  final CrossAxisAlignment? crossAlignment;

  final ButtonType buttonType;

  const DButton.textButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.textType = DTextType.subTitle,
    this.radius,
    this.icon,
    this.color,
    this.mainAlignment,
    this.crossAlignment,
  })  : assert(text != null),
        buttonColorType = null,
        styled = null,
        iconSize = null,
        padding = null,
        tooltip = null,
        buttonType = ButtonType.textButton,
        super(key: key);

  const DButton.roundButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.buttonColorType,
    this.textType = DTextType.subTitle,
    this.radius,
    this.styled = false,
    this.icon,
    this.color,
  })  : assert(text != null && onPressed != null),
        mainAlignment = null,
        crossAlignment = null,
        iconSize = null,
        padding = null,
        tooltip = null,
        buttonType = ButtonType.roundButton,
        super(key: key);

  const DButton.iconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.buttonColorType,
    this.iconSize = 13,
    this.padding = EdgeInsets.zero,
    required this.tooltip,
  })  : assert(icon != null && onPressed != null),
        text = null,
        textType = null,
        mainAlignment = null,
        crossAlignment = null,
        radius = null,
        styled = null,
        color = null,
        buttonType = ButtonType.iconButton,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget? result;

    if (buttonType == ButtonType.roundButton) {
      result = ElevatedButton(
        onPressed: onPressed ?? () {},
        onLongPress: () {},
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
          backgroundColor: MaterialStateProperty.all<Color>(
              getBackGroundButtonColor(buttonType: buttonColorType)),
          foregroundColor: MaterialStateProperty.all<Color>(
              getForeGroundButtonColor(buttonType: buttonColorType)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 0),
              side: BorderSide(
                color: getBackGroundButtonColor(buttonType: buttonColorType),
              ),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(width: 45, height: 45),
            (icon == null)
                ? DText.title(
                    text: text, textType: textType ?? DTextType.subTitle)
                : DText.iconText(
                    text: text,
                    icon: icon,
                    textType: textType ?? DTextType.subTitle),
            styled == true
                ? Container(
                    alignment: Alignment.center,
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 255, 255, 0.2),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: const Icon(
                      Icons.arrow_forward_rounded,
                      color: Colors.white,
                    ),
                  )
                : const SizedBox(width: 45, height: 45),
          ],
        ),
      );
    }

    if (buttonType == ButtonType.textButton) {
      result = Row(
        mainAxisAlignment: mainAlignment ?? MainAxisAlignment.center,
        crossAxisAlignment: crossAlignment ?? CrossAxisAlignment.center,
        children: [
          TextButton(
            onPressed: onPressed,
            style: ButtonStyle(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.fromLTRB(5, 0, 1, 5)),
              foregroundColor: MaterialStateProperty.all<Color>(
                  getForeGroundButtonColor(buttonType: buttonColorType)),
            ),
            child: icon == null
                ? DText.title(
                    text: text,
                    textType: textType ?? DTextType.subTitle,
                    color: color ?? DColorType.themeColor)
                : DText.iconText(
                    text: ' $text',
                    icon: icon,
                    textType: textType ?? DTextType.subTitle,
                    color: color ?? DColorType.themeColor),
          ),
        ],
      );
    }

    if (buttonType == ButtonType.iconButton) {
      result = IconButton(
        padding: padding!,
        constraints: const BoxConstraints(),
        onPressed: onPressed,
        icon: Icon(icon,
            color:
                color ?? getForeGroundButtonColor(buttonType: buttonColorType),
            size: iconSize),
        color: color,
        tooltip: tooltip,
      );
    }

    return result!;
  }
}
