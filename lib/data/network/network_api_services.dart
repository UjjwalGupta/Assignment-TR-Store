import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:tr_store/data/network/base_api_services.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future getApi(String url, {int? id}) async {
    dynamic responseJson;
    try {
      final response = await get("").timeout(const Duration(seconds: 30));
      responseJson = returnResponse(response);
    } on SocketException {
      throw Exception("Something went wrong");
    } on TimeoutException {
      throw Exception("Timeout");
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
      throw Exception("Something went wrong");
    } on TimeoutException {
      throw Exception("Timeout");
    }
    return responseJson;
  }

  dynamic returnResponse(Response response) {
    switch(response.statusCode){
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      case 400:
        throw Exception("Invalid exception");

      default:
        throw Exception("something went wrong");
    }
  }

}
