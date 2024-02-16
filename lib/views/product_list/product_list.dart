import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_store/data/resonse/status.dart';
import 'package:tr_store/models/product_list/ProductModel.dart';
import 'package:tr_store/res/components/app_toolbar.dart';
import 'package:tr_store/res/strings/app_strings.dart';
import 'package:tr_store/view_models/product_list_view_model/product_list_view_model.dart';
import 'package:tr_store/views/product_list/widgets/product_item.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final _appStrings = AppStrings.instance;
  final _productListViewModel = Get.put(ProductListViewModel());

  @override
  void initState() {
    super.initState();
    _productListViewModel.getProductList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppToolbar(_appStrings.productList, false),
        body: Obx(() {
          switch (_productListViewModel.requestStatus.value) {
            case Status.LOADING:
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            case Status.ERROR:
              return Scaffold(
                body: Center(
                  child: Text(_appStrings.somethingWentWrong),
                ),
              );
            case Status.SUCCESS:
              return ListView.builder(
                  itemCount: _productListViewModel.productList.length,
                  itemBuilder: (context, i) {
                    return ProductItem(
                        productModel: _productListViewModel.productList[i]);
                  });
          }
        }));
  }
}
