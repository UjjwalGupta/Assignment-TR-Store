import 'package:get/get.dart';
import 'package:tr_store/res/routes/routes_name.dart';
import 'package:tr_store/views/cart_products/cart_products.dart';
import 'package:tr_store/views/product_details/product_details.dart';
import 'package:tr_store/views/product_list/product_list.dart';

class AppRoutes {
  // Singleton pattern
  AppRoutes._internal();
  static final AppRoutes _instance = AppRoutes._internal();
  static AppRoutes get instance => _instance;

  final routesName = RoutesName.instance;

  appRoutes() => [
        GetPage(
            name: routesName.productListScreen,
            page: () => const ProductList(),),
        GetPage(
            name: routesName.productDetailsScreen,
            page: () => const ProductDetails(),),
        GetPage(
            name: routesName.cartProductsScreen,
            page: () => const CartProducts(),),
      ];
}
