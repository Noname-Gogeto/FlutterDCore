import 'package:flutter/material.dart';

import 'notification_dialog.dart';

void showDunfinishedFeaturesDialog(BuildContext context) {
  showDNotificationDialog(
    context,
    title: 'Unfinished Features',
    message: 'This feature is not yet implemented. Please check back later.',
  );
}
