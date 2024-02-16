import 'dart:convert';

import 'package:tr_store/models/product_list/ProductModel.dart';
import 'package:tr_store/res/app_url/app_url.dart';

import '../../data/network/network_api_services.dart';

class ProductListRepository {
  final _networkApiService = NetworkApiServices.instance;
  final _appUrl = AppUrl.instance;
  List<ProductModel> productList = [];

  Future<List<ProductModel>> productListApi() async {
    List<dynamic> response =
        await _networkApiService.getApi(_appUrl.productUrl);
    for (dynamic data in response) {
      productList.add(ProductModel.fromJson(data));
    }
    return productList;
  }
}
