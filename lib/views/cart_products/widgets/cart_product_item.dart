import 'package:flutter/material.dart';
import 'package:tr_store/models/product_list/ProductModel.dart';
import 'package:tr_store/res/strings/app_strings.dart';
import 'package:tr_store/views/cart_products/widgets/button_remove_cart.dart';

class CartProductItem extends StatelessWidget {
  CartProductItem({super.key, required this.productModel});

  ProductModel productModel;
  final _appString = AppStrings.instance;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Image.network(
                productModel.thumbnail!,
                height: 200,
                errorBuilder: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                productModel.title!,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ),
            productModel.userId != null?Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                '${_appString.price}: \$${productModel.userId!}',
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ):Container(),
            ButtonRemoveFromCart(product: productModel,)
          ],
        ),
      ),
    );
  }
}
