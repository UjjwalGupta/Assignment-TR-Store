import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:tr_store/res/routes/routes.dart';

void main() {
  runApp(TRStoreApp());
}

class TRStoreApp extends StatelessWidget {
  TRStoreApp({Key? key}) : super(key: key);

  final appRoutes = AppRoutes.instance;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: appRoutes.appRoutes(),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
