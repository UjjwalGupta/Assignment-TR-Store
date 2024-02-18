import 'package:get/get.dart';

import '../view_models/connectivity_view_model/connectivity_view_model.dart';

class ConnectivityInjection {
  static void init(){
    Get.put<ConnectivityViewModel>(ConnectivityViewModel(), permanent: true);
  }
}