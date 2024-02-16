import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_store/res/components/app_toolbar.dart';
import 'package:tr_store/res/strings/app_strings.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final _appString = AppStrings.instance;
  int productId = Get.arguments as int;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppToolbar(_appString.details, true),
      body: Text(productId.toString()),
    );
  }
}
