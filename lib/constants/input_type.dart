import 'package:flutter/cupertino.dart';

/// Creating an enum called DTextFieldType with the values none, text, number, price, password,
/// multiline, date, email, url, phone, and address.
enum DTextFieldType {
  none,
  text,
  number,
  price,
  password,
  multiline,
  date,
  email,
  url,
  phone,
  address,
}

/// It takes a `DTextFieldType` enum and returns a `TextInputType` enum
///
/// Args:
///   inputType (DTextFieldType): The type of text field.
///
/// Returns:
///   A map of DTextFieldType to TextInputType.
TextInputType getTextFieldType({required DTextFieldType inputType}) {
  const map = {
    DTextFieldType.text: TextInputType.text,
    DTextFieldType.number: TextInputType.number,
    DTextFieldType.price: TextInputType.number,
    DTextFieldType.password: TextInputType.visiblePassword,
    DTextFieldType.multiline: TextInputType.multiline,
    DTextFieldType.date: TextInputType.datetime,
    DTextFieldType.email: TextInputType.emailAddress,
    DTextFieldType.url: TextInputType.url,
    DTextFieldType.phone: TextInputType.phone,
    DTextFieldType.address: TextInputType.streetAddress,
  };

  return map[inputType] ?? TextInputType.text;
}
