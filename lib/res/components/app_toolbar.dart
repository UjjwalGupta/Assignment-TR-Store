import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppToolbar extends AppBar {
  AppToolbar(String title, bool isBackIcon, {super.key}):super(
      backgroundColor: Colors.green,
      leading: isBackIcon
          ? IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_ios_new),
            )
          : Container(),
      leadingWidth: isBackIcon?30:0,
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
    );
}
