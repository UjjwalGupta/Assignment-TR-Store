class RoutesName {
  // static RoutesName? _routesNameInstance;
  // RoutesName._();
  // factory RoutesName(){
  //   // _routesNameInstance ??= RoutesName._();
  //   return _routesNameInstance!;
  // }

  // Singleton pattern
  RoutesName._internal();

  static final RoutesName _instance = RoutesName._internal();

  static RoutesName get instance => _instance;

  String productListScreen = '/';
  String productDetailsScreen = '/ProductDetails';
  String cartProductsScreen = '/CartProducts';
}
