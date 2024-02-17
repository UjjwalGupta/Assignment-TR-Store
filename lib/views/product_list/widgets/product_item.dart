import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_store/models/product_list/ProductModel.dart';
import 'package:tr_store/res/routes/routes.dart';
import 'package:tr_store/res/routes/routes_name.dart';
import 'package:tr_store/res/strings/app_strings.dart';

import '../../../view_models/cart_view_model/cart_view_model.dart';

class ProductItem extends StatelessWidget {
  ProductItem({super.key, required this.productModel});

  ProductModel productModel;
  final _appString = AppStrings.instance;
  final _routeNames = RoutesName.instance;
  final _cartViewModel = Get.put(CartViewModel());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.toNamed(_routeNames.productDetailsScreen,
            arguments: productModel.id);
      },
      child: Padding(
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
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: ElevatedButton(
                    onPressed: () async{
                     await _cartViewModel.insertProductToCart(productModel);
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
        ),
      ),
    );
  }
}
