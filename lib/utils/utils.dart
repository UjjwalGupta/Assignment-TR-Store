import 'dart:ui';

import 'package:get/get.dart';

class Utils {
  static showSnackBar(String title, String message, {Color? color}) {
    Get.snackbar(title, message,
        backgroundColor: color!, snackPosition: SnackPosition.BOTTOM);
  }
}
