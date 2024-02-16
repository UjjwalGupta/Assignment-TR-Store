import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:tr_store/data/network/base_api_services.dart';

import '../../res/strings/app_strings.dart';

class NetworkApiServices extends BaseApiServices {
  // Singleton pattern
  NetworkApiServices._internal();

  static final NetworkApiServices _instance = NetworkApiServices._internal();

  static NetworkApiServices get instance => _instance;
  
  final _appStrings = AppStrings.instance;

  @override
  Future getApi(String url, {int? id}) async {
    dynamic responseJson;
    try {
      final response = await get(id!=null?'$url/$id':url).timeout(const Duration(seconds: 30));
      responseJson = returnResponse(response);
    } on SocketException {
      throw Exception(_appStrings.somethingWentWrong);
    } on TimeoutException {
      throw Exception(_appStrings.timeOut);
    }
    return responseJson;
  }

  @override
  Future postApi(String url, {int? id}) async{
    dynamic responseJson;
    try {
      final response = await post("url", "body").timeout(const Duration(seconds: 30));
      responseJson = returnResponse(response);
    } on SocketException {
      throw Exception(_appStrings.somethingWentWrong);
    } on TimeoutException {
      throw Exception(_appStrings.timeOut);
    }
    return responseJson;
  }

  dynamic returnResponse(Response response) {
    switch(response.statusCode){
      case 200:
        dynamic responseJson = response.body;
        return responseJson;
      case 400:
        throw Exception(_appStrings.invalidException);

      default:
        throw Exception(_appStrings.somethingWentWrong);
    }
  }

}
