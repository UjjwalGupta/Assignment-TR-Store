import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_store/res/components/app_toolbar.dart';
import 'package:tr_store/res/strings/app_strings.dart';
import 'package:tr_store/view_models/product_details_view_model/product_details_view_model.dart';

import '../../data/resonse/status.dart';
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
      appBar: AppToolbar(_appString.details, true, _routesName),
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
                      errorBuilder: (context, url, error) =>
                          const Icon(Icons.error),
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
                        onPressed: () {},
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
      }),
    );
  }
}
