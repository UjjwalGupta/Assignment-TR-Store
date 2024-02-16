import 'dart:convert';

import 'package:get/get.dart';
import 'package:tr_store/data/network/network_api_services.dart';
import 'package:tr_store/models/product_list/ProductModel.dart';
import 'package:tr_store/repositories/product_list_repository/product_list_repository.dart';
import 'package:tr_store/res/colors/app_colors.dart';
import 'package:tr_store/utils/utils.dart';

import '../../data/resonse/status.dart';

class ProductListViewModel extends GetxController{
  final _productRepository = ProductListRepository();
  final _appColor = AppColors.instance;

  final requestStatus = Status.LOADING.obs;
  final productList = <ProductModel>[].obs;

  void setRequestStatus(Status value) => requestStatus.value = value;
  void setProductList(List<ProductModel> model) => productList.value = model;

  void getProductList(){
    _productRepository.productListApi().then((value){
      print("then ujjwal: "+value.length.toString());
      setRequestStatus(Status.SUCCESS);
      setProductList(value);
    }).onError((error, stackTrace){
      setRequestStatus(Status.ERROR);

      print("error ujjwal: "+error.toString());
      Utils.showSnackBar("Error", error.toString(), color: _appColor.blackColor);
    });
  }
}