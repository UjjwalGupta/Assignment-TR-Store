import 'package:get/get.dart';

abstract class BaseApiServices extends GetConnect {

  Future<dynamic> getApi(String url, {int? id});

  Future<dynamic> postApi(String url, {int? id});

}
