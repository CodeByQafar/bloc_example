import 'package:flutter/material.dart';

import '../constants/duration.dart';

class AppSnackbars {
 static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: AppDurations.long),
    );
  }
}
