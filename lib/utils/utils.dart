import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils {
  // Singleton pattern
  Utils._internal();

  static final Utils _instance = Utils._internal();

  static Utils get instance => _instance;

  showSnackBar(String title, String message, Color backgroundColor,
      {Color? textColor, Duration? duration}) {
    Get.snackbar(title, message,
        titleText: Text(title,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: textColor ?? Colors.white)),
        messageText: Text(
          message,
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: textColor ?? Colors.white),
        ),
        backgroundColor: backgroundColor,
        colorText: textColor ?? Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        duration: duration ?? const Duration(seconds: 5));
  }
}
