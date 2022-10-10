import 'package:flutter/material.dart';

//* Default App Colors

mixin DColorType {
  static const themeColor = Color.fromRGBO(230, 109, 62, 1);
  static const themeBorderColor = Color.fromRGBO(230, 109, 62, 0.5);
  static const secondaryColor = Color.fromRGBO(0, 0, 0, 1);
  static const textColor = Color.fromRGBO(0, 0, 0, 1);

  static const componentTextColor = Color.fromRGBO(255, 255, 255, 1);
  static const componentButtonBackground = Colors.white;
  static const componentButtonBorder = Color.fromRGBO(0, 0, 0, 1);
  static const componentPrimaryColor = Color.fromRGBO(251, 148, 0, 1);
  static const componentSecondarycolor = Color.fromRGBO(255, 244, 230, 1);

  static const textLabelColor = Colors.grey;
  static const successColor = Colors.lightGreen;

  static const buttonPrimaryColorDeactive = Color.fromRGBO(233, 163, 33, 0.8);
  static const buttonPrimaryColorActive = Color.fromRGBO(251, 148, 0, 1);
  static const buttonPrimaryColorText = Colors.white;
  static const buttonSecondaryColorActive = Color.fromRGBO(255, 244, 230, 1);
  static const buttonSecondaryColorText = Color.fromRGBO(251, 148, 0, 1);
}

/// A list of all the possible button types.
enum DButtonType {
  // none,
  theme,
  primary,
  secondary,
  success,
  warning,
  danger,
  info,
  light,
  dark,
}

/// It returns a color based on the button type
///
/// Args:
///   buttonType (DButtonType): The type of button you want to use.
///
/// Returns:
///   A Color object.
getBackGroundButtonColor({DButtonType? buttonType}) {
  const buttonColor = {
    // DButtonType.none: DColorType.themeColor,
    DButtonType.theme: DColorType.themeColor,
    DButtonType.primary: DColorType.buttonPrimaryColorActive,
    DButtonType.secondary: DColorType.buttonSecondaryColorActive,
    DButtonType.success: DColorType.successColor,
    DButtonType.warning: Colors.yellow,
    DButtonType.danger: Colors.red,
    DButtonType.info: Color.fromRGBO(13, 202, 240, 1),
    DButtonType.light: Colors.white,
    DButtonType.dark: Colors.black,
  };

  return buttonColor[buttonType] ?? DColorType.themeColor;
}

/// It returns the foreground color of the button based on the button type
///
/// Args:
///   buttonType (DButtonType): The type of button you want to create.
///
/// Returns:
///   A function that returns a Color.
Color getForeGroundButtonColor({DButtonType? buttonType}) {
  switch (buttonType) {
    case DButtonType.theme:
    case DButtonType.primary:
    case DButtonType.secondary:
    case DButtonType.success:
    case DButtonType.warning:
    case DButtonType.danger:
    case DButtonType.info:
    case DButtonType.dark:
      return Colors.white;
    case DButtonType.light:
      return Colors.black;
    default:
      return DColorType.themeColor;
  }
}
