import 'dart:convert';

import 'package:get/get.dart';
import 'package:tr_store/models/product_list/ProductModel.dart';
import 'package:tr_store/repositories/product_list_repository/product_list_repository.dart';
import 'package:tr_store/res/colors/app_colors.dart';
import 'package:tr_store/res/strings/app_strings.dart';
import 'package:tr_store/utils/utils.dart';

import '../../data/response/status.dart';

class ProductListViewModel extends GetxController{
  final _productRepository = ProductListRepository();
  final _appStrings = AppStrings.instance;
  final _appColor = AppColors.instance;
  final _utils = Utils.instance;

  final requestStatus = Status.LOADING.obs;
  final productList = <ProductModel>[].obs;

  void setRequestStatus(Status value) => requestStatus.value = value;
  void setProductList(List<ProductModel> model) => productList.value = model;

  void getProductList(){
    _productRepository.productListApi().then((value){
      setRequestStatus(Status.SUCCESS);
      setProductList(value);
    }).onError((error, stackTrace){
      setRequestStatus(Status.ERROR);
      _utils.showSnackBar(_appStrings.error, error.toString(), _appColor.redColor);
    });
  }
}