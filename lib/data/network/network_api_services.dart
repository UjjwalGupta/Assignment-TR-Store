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
      // print("convert ujjwal: enter");
      final response = await get(id!=null?'$url/$id':url).timeout(const Duration(seconds: 30));
      responseJson = returnResponse(response);
      // print("convert ujjwal: "+responseJson.toString());
    } on SocketException {
      print("convert ujjwal000: "+responseJson.toString());
      throw Exception(_appStrings.somethingWentWrong);
    } on TimeoutException {
      print("convert ujjwal111: "+responseJson.toString());
      throw Exception(_appStrings.timeOut);
    }
    // print("convert ujjwal: "+responseJson.toString());
    return responseJson;
  }

  // @override
  Future postApi(String url, {int? id}) async{
  //   dynamic responseJson;
  //   try {
  //     final response = await post("url", "body").timeout(const Duration(seconds: 30));
  //     responseJson = returnResponse(response);
  //   } on SocketException {
  //     print("convert ujjwal: "+responseJson.toString());
  //     throw Exception(_appStrings.somethingWentWrong);
  //   } on TimeoutException {
  //     print("convert ujjwal: "+responseJson.toString());
  //     throw Exception(_appStrings.timeOut);
  //   }
  //   return responseJson;
  }

  dynamic returnResponse(Response response) {
    switch(response.statusCode){
      case 200:
        dynamic responseJson = response.body;
        // print("before convert ujjwal: "+responseJson.toString());
        return responseJson;
      case 400:
        print("convert ujjwal2222: ");
        throw Exception(_appStrings.invalidException);

      default:
        print("convert ujjwal333: ");
        throw Exception(_appStrings.somethingWentWrong);
    }
  }

}
