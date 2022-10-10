import 'package:flutter/material.dart';

void showDLicense(BuildContext context) {
  showAboutDialog(
    context: context,
    applicationName: 'DCore',
    applicationIcon: Image.asset(
      "lib/assets/images/main-icon.png",
      height: 50,
      width: 50,
    ),
    applicationVersion: '1.0.0',
    applicationLegalese: '© 2022 DCore',
    useRootNavigator: true,
    // anchorPoint: const Offset(0.5, 0.5),
  );
}
