import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_store/view_models/cart_view_model/cart_view_model.dart';

import '../../../res/strings/app_strings.dart';
import '../../../view_models/product_details_view_model/product_details_view_model.dart';

class ProductDetailsItem extends StatelessWidget {
  ProductDetailsItem({super.key});

  final ProductDetailsViewModel _productDetailsViewModel = Get.find();
  final CartViewModel _cartViewModel = Get.find();
  final _appString = AppStrings.instance;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Image.network(
              _productDetailsViewModel.product.value.thumbnail!,
              height: 200,
              errorBuilder: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              _productDetailsViewModel.product.value.title!,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              _productDetailsViewModel.product.value.content!,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.normal),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: ElevatedButton(
                onPressed: () {
                  _cartViewModel.insertProductToCart(_productDetailsViewModel.product.value);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    textStyle: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                child: Text(
                  _appString.addToCart,
                  style: const TextStyle(color: Colors.white),
                )),
          )
        ],
      ),
    );
  }
}
