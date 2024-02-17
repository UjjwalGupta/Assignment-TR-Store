import 'dart:convert';

import 'package:get/get.dart';
import 'package:tr_store/models/product_list/ProductModel.dart';
import 'package:tr_store/repositories/product_details_repository/product_details_repository.dart';
import 'package:tr_store/res/colors/app_colors.dart';
import 'package:tr_store/res/strings/app_strings.dart';
import 'package:tr_store/utils/utils.dart';

import '../../data/response/status.dart';

class ProductDetailsViewModel extends GetxController{
  final _productRepository = ProductDetailsRepository();
  final _appColor = AppColors.instance;
  final _appStrings = AppStrings.instance;
  final _utils = Utils.instance;

  final requestStatus = Status.LOADING.obs;
  final product = ProductModel().obs;


  void setRequestStatus(Status value) => requestStatus.value = value;
  void setProduct(ProductModel model) => product.value = model;

  void getProductDetails(int productId){
    _productRepository.getProductDetails(productId).then((value){
      setRequestStatus(Status.SUCCESS);
      setProduct(value);
    }).onError((error, stackTrace){
      setRequestStatus(Status.ERROR);
      _utils.showSnackBar(_appStrings.error, error.toString(), _appColor.redColor);
    });
  }
}