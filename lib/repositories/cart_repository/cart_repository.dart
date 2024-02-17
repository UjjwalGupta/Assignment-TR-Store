import 'package:tr_store/data/database/cart_products_db.dart';
import 'package:tr_store/models/product_list/ProductModel.dart';

class CartRepository {
  final _cartDatabase = CartProductsDB.instance;

  Future<int> insertProductToCart(ProductModel productModel) async {
    return _cartDatabase.insertProductToCart(productModel: productModel);
  }

  Future<bool> checkExistingProductFromCart(ProductModel productModel) async {
    return _cartDatabase.checkExistingProductFromCart(productModel: productModel);
  }

  Future<List<ProductModel>> getAllProductsFromCart() async {
    return _cartDatabase.fetchAllProducts();
  }

  Future<ProductModel> getProductFromCartById(int id) async {
    return _cartDatabase.fetchProductById(id);
  }

  Future<int> deleteProductFromCartById(int id) async {
    return _cartDatabase.deleteProduct(id);
  }
}
