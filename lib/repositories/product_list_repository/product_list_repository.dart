import 'dart:convert';

import 'package:tr_store/models/product_list/ProductModel.dart';
import 'package:tr_store/res/app_url/app_url.dart';

import '../../data/network/network_api_services.dart';

class ProductListRepository {
  final _networkApiService = NetworkApiServices.instance;
  final _appUrl = AppUrl.instance;

  Future<List<ProductModel>> productListApi() async{
    List<dynamic> response = await _networkApiService.getApi(_appUrl.productUrl);
    print("repository ujjwal111: "+response.length.toString());
    // List<ProductModel> list = List<ProductModel>.from(response);
    // print("repository ujjwal2222: "+response.length.toString());
    List<ProductModel> getData = [];
    // getData.addAll(List<ProductModel>.from(json.decode(response).map((x) => ProductModel.fromJson(x))));
for(dynamic data in response){
  getData.add(ProductModel.fromJson(data));
}
    return getData;//response.map((job) =>  productModelFromJson(job)).toList();
    // return productModelFromJson(response.toString());//ProductModel.fromJson(response[0]);
  }
}