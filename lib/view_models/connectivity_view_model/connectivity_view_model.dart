import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_store/res/strings/app_strings.dart';
import 'package:tr_store/utils/utils.dart';

class ConnectivityViewModel extends GetxController {
  final _connectivity = Connectivity();
  final _utils = Utils.instance;
  final _appStrings = AppStrings.instance;

  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void _updateConnectionStatus(ConnectivityResult connectivityResult) {
    if (connectivityResult == ConnectivityResult.none) {
      _utils.showSnackBar(
          _appStrings.internet, _appStrings.noInternetConnection, Colors.red,
          duration: const Duration(seconds: 5));
    } else {
      _utils.showSnackBar(
          _appStrings.internet, _appStrings.internetConnected, Colors.green,
          duration: const Duration(seconds: 5));
    }
  }
}
