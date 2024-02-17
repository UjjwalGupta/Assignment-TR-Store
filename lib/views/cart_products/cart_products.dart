import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_store/res/components/app_toolbar.dart';
import 'package:tr_store/res/strings/app_strings.dart';
import 'package:tr_store/view_models/cart_view_model/cart_view_model.dart';

import '../../data/response/status.dart';
import '../product_list/widgets/shimmer_effect.dart';
import 'widgets/cart_product_item.dart';

class CartProducts extends StatefulWidget {
  const CartProducts({super.key});

  @override
  State<CartProducts> createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  final _cartViewModel = Get.put(CartViewModel());
  final _appStrings = AppStrings.instance;

  @override
  void initState() {
    super.initState();
    _cartViewModel.getAllProductsFromCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppToolbar(_appStrings.myCart, true, false),
      body: Obx(() {
        switch (_cartViewModel.requestStatus.value) {
          case Status.LOADING:
            return ListView.builder(
                itemCount: 10,
                itemBuilder: (context, i) {
                  return const ShimmerEffect();
                });
          case Status.ERROR:
            return Center(
              child: Text(_appStrings.somethingWentWrong),
            );
          case Status.SUCCESS:
            return _cartViewModel.productList.isNotEmpty? ListView.builder(
                itemCount: _cartViewModel.productList.length,
                itemBuilder: (context, i) {
                  return CartProductItem(
                      productModel: _cartViewModel.productList[i]);
                }): Center(child: Text(_appStrings.noProductInCart, style: const TextStyle(fontSize: 25, color: Colors.black),),);
        }
      }));
  }
}
