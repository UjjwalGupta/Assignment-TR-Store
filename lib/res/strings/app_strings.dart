class AppStrings{
  // Singleton pattern
  AppStrings._internal();

  static final AppStrings _instance = AppStrings._internal();

  static AppStrings get instance => _instance;

  String appTitle = "TR Store";
  String somethingWentWrong = "Something went wrong";
  String timeOut = "Timeout";
  String invalidException = "Invalid exception";
  String productList = "Product list";
  String details = "Details";
  String addToCart = "Add To Cart";

}