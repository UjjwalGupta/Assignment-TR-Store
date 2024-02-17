import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors{

  // Singleton pattern
  AppColors._internal();

  static final AppColors _instance = AppColors._internal();

  static AppColors get instance => _instance;

  Color blackColor = const Color(0x00f00000);
  Color greenColor = Colors.green;
  Color redColor = Colors.red;
}