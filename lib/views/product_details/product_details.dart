import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_store/res/components/app_toolbar.dart';
import 'package:tr_store/res/strings/app_strings.dart';
import 'package:tr_store/view_models/product_details_view_model/product_details_view_model.dart';
import 'package:tr_store/views/product_details/widgets/product_details_item.dart';

import '../../data/response/status.dart';
import '../../res/routes/routes_name.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final _appString = AppStrings.instance;
  int productId = Get.arguments as int;
  final _routesName = RoutesName.instance;
  final _productDetailsViewModel = Get.put(ProductDetailsViewModel());

  @override
  void initState() {
    super.initState();
    _productDetailsViewModel.getProductDetails(productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppToolbar(_appString.details, true, true, routesName: _routesName),
      body: Obx(() {
        switch (_productDetailsViewModel.requestStatus.value) {
          case Status.LOADING:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case Status.ERROR:
            return Scaffold(
              body: Center(
                child: Text(_appString.somethingWentWrong),
              ),
            );
          case Status.SUCCESS:
            return ProductDetailsItem();
        }
      }),
    );
  }
}
