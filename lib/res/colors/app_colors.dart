import 'dart:ui';

class AppColors{

  // Singleton pattern
  AppColors._internal();

  static final AppColors _instance = AppColors._internal();

  static AppColors get instance => _instance;

  Color blackColor = const Color(0x00f00000);
}