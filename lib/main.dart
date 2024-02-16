import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:tr_store/res/routes/routes.dart';
import 'package:tr_store/res/strings/app_strings.dart';

void main() {
  runApp(TRStoreApp());
}

class TRStoreApp extends StatelessWidget {
  TRStoreApp({Key? key}) : super(key: key);

  final _appRoutes = AppRoutes.instance;
  final _appStrings = AppStrings.instance;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: _appStrings.appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: _appRoutes.appRoutes(),
    );
  }
}
