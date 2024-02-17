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
  String addedToCart = "added to cart successfully";
  String removeFromCart = "Remove from cart";
  String removeSuccessFromCart = "Product removed from cart successfully";
  String noProductInCart = "No products in your cart";
  String myCart = "My Carts";
  String success = "Success";
  String error = "Error";

}