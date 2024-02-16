import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tr_store/models/product_list/ProductModel.dart';
import 'package:tr_store/res/strings/app_strings.dart';

class ProductItem extends StatelessWidget {
  ProductItem({super.key, required this.productModel});

  ProductModel productModel;
  final _appString = AppStrings.instance;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CachedNetworkImage(
          imageUrl: productModel.url!,
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        Text(
          productModel.title!,
          style: const TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                textStyle:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            child: Text(
              _appString.addToCart,
              style: const TextStyle(color: Colors.black),
            ))
      ],
    );
  }
}
