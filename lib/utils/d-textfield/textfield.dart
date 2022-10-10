import 'package:dcore/constants/colors.dart';
import 'package:dcore/constants/display.dart';
import 'package:dcore/constants/input_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_launcher_icons/utils.dart';
import 'package:intl/intl.dart';

enum TextFiledType { underline, boxShadow }

class DTextField extends StatelessWidget {
  final String? label;
  final TextEditingController? controller;
  final Color? color;
  final DTextFieldType? type;

  /// This is availble when type is [DTextFieldType.date]
  final String? customDateFormat;
  final IconData? prefixIcon;
  final bool? alwaysShowLabel;
  final double? width;
  final Function()? onChanged;
  final Function(String)? onKeyPressed;
  final Function()? onDateRemove;
  final Function()? onDateConfirm;

  final TextFiledType textFieldType;

  const DTextField.underLine({
    Key? key,
    required this.label,
    required this.controller,
    this.color,
    this.type = DTextFieldType.text,
    this.onDateRemove,
    this.onDateConfirm,
    this.alwaysShowLabel = false,
    this.customDateFormat = 'dd/MM/yyyy',
    this.prefixIcon,
  })  : assert(label != null && controller != null),
        onChanged = null,
        onKeyPressed = null,
        width = null,
        textFieldType = TextFiledType.underline,
        super(key: key);

  const DTextField.boxShadow({
    Key? key,
    required this.label,
    required this.controller,
    this.color,
    this.type = DTextFieldType.text,
    this.onDateRemove,
    this.onDateConfirm,
    this.customDateFormat = 'dd/MM/yyyy',
    this.prefixIcon,
    this.alwaysShowLabel = false,
    this.width,
    this.onChanged,
    this.onKeyPressed,
  })  : assert(label != null && controller != null),
        textFieldType = TextFiledType.boxShadow,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    InputDecoration textFieldDecoration =
        (textFieldType == TextFiledType.underline)
            ? InputDecoration(
                hintText: label,
                label: Text(label!),
                labelStyle: TextStyle(
                    color: color ?? DColorType.themeColor,
                    fontSize: getFontSize(fontSizeType: DTextType.label)),
                prefix: (prefixIcon != null)
                    ? Icon(
                        prefixIcon,
                        color: color ?? DColorType.themeColor,
                      )
                    : null,

                // suffixIcon: IconButton(
                //   icon: const Icon(Icons.visibility_off),
                //   onPressed: () {},
                // ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: color ?? DColorType.themeColor),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: color ?? DColorType.themeColor),
                ),
              )
            : InputDecoration(
                contentPadding:
                    const EdgeInsets.all(DDecorationType.contentPadding),
                hintText: label!,
                label: Text(label!),
                labelStyle: TextStyle(
                    color: color ?? DColorType.themeColor,
                    fontSize: getFontSize(fontSizeType: DTextType.label)),
                prefix: (prefixIcon != null)
                    ? Icon(
                        prefixIcon,
                        color: color ?? DColorType.themeColor,
                      )
                    : null,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: color ?? Colors.transparent),
                  borderRadius:
                      BorderRadius.circular(DDecorationType.defaultRadius),
                ),
                filled: true,
                fillColor: const Color.fromRGBO(250, 250, 250, 1),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: color ?? Colors.transparent),
                  borderRadius:
                      BorderRadius.circular(DDecorationType.defaultRadius),
                ),
              );

    Widget tmpTextField = TextField(
      controller: controller,
      cursorColor: color ?? DColorType.themeColor,
      keyboardType: getTextFieldType(inputType: type!),
      obscureText: type == DTextFieldType.password,
      enableSuggestions: type != DTextFieldType.password,
      autocorrect: type != DTextFieldType.password,
      textInputAction: TextInputAction.next,
      decoration: textFieldDecoration,
      onChanged: onKeyPressed ?? (value) {},
      onEditingComplete: onChanged ?? () {},
      maxLines: (type == DTextFieldType.multiline) ? 5 : 1,
      style: TextStyle(
          color: DColorType.textColor,
          fontSize: getFontSize(fontSizeType: DTextType.defaultText)),
      readOnly: (type == DTextFieldType.date),
      onTap: type == DTextFieldType.date
          ? () {
              DatePicker.showDatePicker(context,
                  showTitleActions: true,
                  minTime: DateTime(1900, 1, 1),
                  maxTime: DateTime(2100, 12, 31), onChanged: (date) {
                printStatus('change $date');
              }, onCancel: () {
                controller!.text = '';
                FocusScope.of(context).requestFocus(FocusNode());
                onDateRemove == null ? null : onDateRemove!();
              }, onConfirm: (date) {
                FocusScope.of(context).requestFocus(FocusNode());
                controller!.text = DateFormat(customDateFormat).format(date);
                onDateConfirm == null ? null : onDateConfirm!();
              }, currentTime: DateTime.now(), locale: LocaleType.vi);
            }
          : () {},
    );

    Widget result = (textFieldType == TextFiledType.underline)
        ? Container(
            margin: const EdgeInsets.symmetric(vertical: 7),
            child: tmpTextField,
          )
        : Container(
            margin: const EdgeInsets.symmetric(vertical: 7),
            width: width ?? MediaQuery.of(context).size.width - 20,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(DDecorationType.defaultRadius),
              boxShadow: [
                BoxShadow(
                  color: DColorType.themeColor.withOpacity(0.2),
                  spreadRadius: 0,
                  blurRadius: 3,
                  offset: const Offset(0, 0), // changes position of shadow
                ),
              ],
            ),
            child: tmpTextField,
          );
    return result;
  }
}
