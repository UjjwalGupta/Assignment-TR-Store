import 'dart:convert';

import 'package:tr_store/models/product_list/ProductModel.dart';
import 'package:tr_store/res/app_url/app_url.dart';

import '../../data/network/network_api_services.dart';

class CartRepository {
  final _networkApiService = NetworkApiServices.instance;
  final _appUrl = AppUrl.instance;

  Future<ProductModel> getProductDetails(int productId) async {
    dynamic response = await _networkApiService.getApi(_appUrl.productUrl, id: productId);
    return ProductModel.fromJson(response);
  }
}
