import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_store/models/product_list/ProductModel.dart';
import 'package:tr_store/view_models/cart_view_model/cart_view_model.dart';

import '../../../res/strings/app_strings.dart';

class ButtonRemoveFromCart extends StatelessWidget {
   ButtonRemoveFromCart({super.key, required this.product});
  final _appString = AppStrings.instance;
  final CartViewModel _cartViewModel = Get.find();
  ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: ElevatedButton(
          onPressed: () {
            _cartViewModel.deleteProductFromCartById(product);
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              textStyle: const TextStyle(
                  fontSize: 14, fontWeight: FontWeight.bold)),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              const Icon(
                Icons.delete_forever,
                color: Colors.white,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                _appString.removeFromCart,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ));
  }
}
