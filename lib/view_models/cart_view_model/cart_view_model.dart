import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_store/models/product_list/ProductModel.dart';
import 'package:tr_store/repositories/cart_repository/cart_repository.dart';
import 'package:tr_store/res/colors/app_colors.dart';
import 'package:tr_store/res/strings/app_strings.dart';
import 'package:tr_store/utils/utils.dart';

import '../../data/response/status.dart';

class CartViewModel extends GetxController {
  final _cartRepository = CartRepository();
  final _appColor = AppColors.instance;
  final _appStrings = AppStrings.instance;
  final _utils = Utils.instance;

  final requestStatus = Status.LOADING.obs;
  final product = ProductModel().obs;
  final productList = <ProductModel>[].obs;

  void setRequestStatus(Status value) => requestStatus.value = value;

  void setProductList(List<ProductModel> model) => productList.value = model;

  void setProduct(ProductModel model) => product.value = model;

  Future<void> checkExistingProductFromCart(ProductModel productModel) async {
    await _cartRepository
        .checkExistingProductFromCart(productModel)
        .then((value) {
      setRequestStatus(Status.SUCCESS);
      if (value) {
        _utils.showSnackBar(
            _appStrings.error, _appStrings.productExistsInCart, Colors.yellow,
            textColor: Colors.black);
      } else {
        insertProductToCart(productModel);
      }
    }).onError((error, stackTrace) {
      setRequestStatus(Status.ERROR);
      _utils.showSnackBar(
          _appStrings.error, error.toString(), _appColor.redColor,
          textColor: Colors.white);
    });
  }

  Future<void> insertProductToCart(ProductModel productModel) async {
    await _cartRepository.insertProductToCart(productModel).then((value) {
      setRequestStatus(Status.SUCCESS);
      _utils.showSnackBar(_appStrings.success,
          "${productModel.title} ${_appStrings.addedToCart}", Colors.green,
          textColor: Colors.white);
    }).onError((error, stackTrace) {
      setRequestStatus(Status.ERROR);
      _utils.showSnackBar(
          _appStrings.error, error.toString(), _appColor.redColor,
          textColor: Colors.white);
    });
  }

  void getAllProductsFromCart() {
    _cartRepository.getAllProductsFromCart().then((value) {
      setRequestStatus(Status.SUCCESS);
      setProductList(value);
    }).onError((error, stackTrace) {
      setRequestStatus(Status.ERROR);
      _utils.showSnackBar(
          _appStrings.error, error.toString(), _appColor.redColor,
          textColor: _appColor.blackColor);
    });
  }

  void getProductFromCartById(int productId) {
    _cartRepository.getProductFromCartById(productId).then((value) {
      setRequestStatus(Status.SUCCESS);
      setProduct(value);
    }).onError((error, stackTrace) {
      setRequestStatus(Status.ERROR);
      _utils.showSnackBar(
          _appStrings.error, error.toString(), _appColor.redColor);
    });
  }

  void deleteProductFromCartById(ProductModel product) {
    _cartRepository.deleteProductFromCartById(product.id!).then((value) {
      setRequestStatus(Status.SUCCESS);
      getAllProductsFromCart();
      _utils.showSnackBar(_appStrings.success,
          _appStrings.removeSuccessFromCart, _appColor.redColor);
    }).onError((error, stackTrace) {
      setRequestStatus(Status.ERROR);
      _utils.showSnackBar(
          _appStrings.error, error.toString(), _appColor.redColor);
    });
  }
}
