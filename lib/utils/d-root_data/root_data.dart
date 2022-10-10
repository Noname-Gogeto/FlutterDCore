import 'package:flutter/material.dart';



/// Temporary documentation for [DRootData]
class RootData extends InheritedWidget {
  const RootData({
    Key? key,
    required Widget child,
    this.myData,
    this.isCheckBoxChecked,
    this.switchValue,
  }) : super(
          key: key,
          child: child,
        );

  // 2
  final int? myData;
  final bool? isCheckBoxChecked;
  final Function(bool?)? switchValue;
  // 3
  @override
  bool updateShouldNotify(RootData oldWidget) {
    return myData != oldWidget.myData;
  }

  // 4
  static RootData? of(BuildContext context) {
    // 5
    return context.dependOnInheritedWidgetOfExactType<RootData>();
  }
}
