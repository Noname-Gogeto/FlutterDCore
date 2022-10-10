import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

//* Default App Display

//? Font size & Font weight

/// A list of all the text types that you want to use in your app.
enum DTextType {
  header1,
  header2,
  title,
  subTitle,
  defaultText,
  label,
}

/// It returns a double value based on the DTextType enum value passed to it
///
/// Args:
///   fontSizeType (DTextType): This is the type of font size you want to use.
///
/// Returns:
///   The value of the key in the FontSizeType map.
double getFontSize({required DTextType fontSizeType}) {
  const mapFontSizeType = {
    DTextType.header1: 20.0,
    DTextType.header2: 18.0,
    DTextType.title: 16.0,
    DTextType.subTitle: 14.0,
    DTextType.defaultText: 13.0,
    DTextType.label: 11.0,
  };

  return mapFontSizeType[fontSizeType] ?? 13.0;
}

/// It takes a `DTextType` enum and returns a `FontWeight` enum
///
/// Args:
///   fontWeightType (DTextType): This is the type of text you want to use.
///
/// Returns:
///   A FontWeight object.
FontWeight getFontWeight({required DTextType fontWeightType}) {
  const mapFontWeightType = {
    DTextType.header1: FontWeight.bold,
    DTextType.header2: FontWeight.bold,
    DTextType.title: FontWeight.bold,
    DTextType.subTitle: FontWeight.bold,
    DTextType.defaultText: FontWeight.normal,
    DTextType.label: FontWeight.normal,
  };

  return mapFontWeightType[fontWeightType] ?? FontWeight.normal;
}

//? Padding-Margin & radius
mixin DDecorationType {
  static const containerPadding = 10.0;
  static const buttonPadding = 8.0;
  static const textFieldPadding = 12.0;
  static const contentPadding = 10.0;
  static const blockMargin = 15.0;
  static const itemListMargin = 10.0;
  static const defaultRadius = 5.0;
}

//? Currency format
/// It takes a number and returns a string with the number formatted with commas
///
/// Args:
///   number: The number to be formatted.
String numberFormat(number) =>
    NumberFormat().format(double.parse(number.toString()));

/// It takes a string and returns a string.
///
/// Args:
///   moneyString: The string to be formatted.
String currencyFormat(moneyString) => '\$: ${numberFormat(moneyString)} VNĐ';
