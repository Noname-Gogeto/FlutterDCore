import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_launcher_icons/utils.dart';
import 'package:intl/intl.dart';
import '../../constants/colors.dart';
import '../../constants/display.dart';

/// A function that returns a widget.
///
/// Args:
///   context (BuildContext): BuildContext
///   hintText (String): The text that will be displayed when the user has not entered any text.
///   type (String): 'password' =&gt; inputType = TextInputType.visiblePassword
///   textController (TextEditingController): TextEditingController
///   onChanged (Function()?): This is a function that is called when the user presses the "Done" button
/// on the keyboard.
///
/// Returns:
///   A Container with a Column with a Theme with a TextField.
Widget textFieldWithLabelAndUnderLine(
  BuildContext context, {
  String? hintText = '',
  String? type,
  TextEditingController? textController,
  Function()? onChanged,
}) {
  TextInputType inputType = TextInputType.text;
  switch (type) {
    case 'password':
      inputType = TextInputType.visiblePassword;
      break;
    case 'number':
      inputType = TextInputType.number;
      break;
    case 'multiline':
      inputType = TextInputType.multiline;
      break;
    default:
      break;
  }
  return Container(
    margin: const EdgeInsets.only(bottom: DDecorationType.blockMargin),
    padding: const EdgeInsets.only(
        left: DDecorationType.textFieldPadding,
        right: DDecorationType.textFieldPadding),
    child: Column(
      children: [
        Theme(
          data: Theme.of(context).copyWith(primaryColor: DColorType.themeColor),
          child: TextField(
            onEditingComplete: onChanged,
            maxLines: type == 'multiline' ? 7 : 1,
            onTap: type == 'date'
                ? () {
                    DatePicker.showDatePicker(context,
                        showTitleActions: true,
                        minTime: DateTime(1900, 3, 5),
                        maxTime: DateTime.now(), onChanged: (date) {
                      printStatus('change $date');
                    }, onConfirm: (date) {
                      textController!.text =
                          DateFormat('dd/MM/yyyy').format(date);
                    }, currentTime: DateTime.now(), locale: LocaleType.vi);
                  }
                : () {},
            controller: textController,
            cursorColor: DColorType.componentPrimaryColor,
            obscureText: type == 'password',
            enableSuggestions: !(type == 'password'),
            autocorrect: !(type == 'password'),
            keyboardType: inputType,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              label: Text(hintText!, style: const TextStyle(fontSize: 13)),
              focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: DColorType.themeColor),
                  borderRadius: BorderRadius.all(
                      Radius.circular(DDecorationType.defaultRadius))),
              enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: DColorType.themeColor),
                  borderRadius: BorderRadius.all(
                      Radius.circular(DDecorationType.defaultRadius))),
              contentPadding: const EdgeInsets.only(
                  left: DDecorationType.textFieldPadding,
                  right: DDecorationType.textFieldPadding),
              // fillColor: Color.fromRGBO(250, 250, 250, 1),
              // filled: true,
            ),
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget textFieldWithLabelAndUnderLinePasswordFormat(
  BuildContext context, {
  String? hintText,
  Function()? func,
  bool? isObscure,
  TextEditingController? textController,
}) {
  return Container(
    margin: const EdgeInsets.only(bottom: DDecorationType.blockMargin),
    padding: const EdgeInsets.only(
        left: DDecorationType.textFieldPadding,
        right: DDecorationType.textFieldPadding),
    child: Column(
      children: [
        Theme(
          data: Theme.of(context).copyWith(primaryColor: DColorType.themeColor),
          child: TextField(
            controller: textController,
            cursorColor: DColorType.componentPrimaryColor,
            obscureText: isObscure!,
            enableSuggestions: !isObscure,
            autocorrect: !isObscure,
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              label: Text(hintText!, style: const TextStyle(fontSize: 13)),
              // prefixIcon: Icon(
              //   Icons.lock,
              //   color: themeColor,
              // ),
              suffixIcon: IconButton(
                icon: Icon(isObscure ? Icons.visibility_off : Icons.visibility),
                onPressed: func,
              ),
              focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: DColorType.themeColor),
                  borderRadius: BorderRadius.all(
                      Radius.circular(DDecorationType.defaultRadius))),
              enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: DColorType.themeColor),
                  borderRadius: BorderRadius.all(
                      Radius.circular(DDecorationType.defaultRadius))),
              contentPadding: const EdgeInsets.only(
                  left: DDecorationType.textFieldPadding,
                  right: DDecorationType.textFieldPadding),
              // fillColor: Color.fromRGBO(250, 250, 250, 1),
              // filled: true,
            ),
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ],
    ),
  );
}
