import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_store/res/routes/routes_name.dart';

class AppToolbar extends AppBar {
  AppToolbar(String title, bool isBackIcon, bool isCartIcon, {RoutesName? routesName, super.key})
      : super(
          backgroundColor: Colors.green,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: isCartIcon?InkWell(
                  onTap: () {
                    Get.toNamed(routesName!.cartProductsScreen);
                  },
                  child: const Icon(
                    Icons.add_shopping_cart,
                    size: 30,
                    color: Colors.white,
                  )):Container(),
            ),
          ],
          leading: isBackIcon
              ? IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                  ),
                )
              : Container(),
          leadingWidth: isBackIcon ? 30 : 0,
          title: Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
        );
}
