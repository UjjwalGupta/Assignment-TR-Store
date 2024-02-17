import 'package:sqflite/sqflite.dart';
import 'package:tr_store/data/database/database_service.dart';
import 'package:tr_store/models/product_list/ProductModel.dart';

class CartProductsDB {
  // Singleton pattern
  CartProductsDB._internal();

  static final CartProductsDB _instance = CartProductsDB._internal();

  static CartProductsDB get instance => _instance;

  final _tableName = "Cart_Products";

  Future<void> createTable(Database database) async {
    await database.execute("""
    CREATE TABLE IF NOT EXISTS $_tableName (
    "id" INTEGER NOT NULL,
    "title" TEXT NOT NULL,
    "userId" INTEGER NOT NULL,
    "content" TEXT NOT NULL,
    "thumbnail" TEXT NOT NULL,
    PRIMARY KEY("id" AUTOINCREMENT)
    );""");
  }

  Future<int> insertProductToCart({required ProductModel productModel}) async {
    final database = await DatabaseService().database;
    return await database.rawInsert(
      '''INSERT INTO $_tableName (id, title, userId, content, thumbnail) VALUES (?,?,?,?,?)''',
      [productModel.id, productModel.title, productModel.userId, productModel.content, productModel.thumbnail],
    );
  }

  Future<bool> checkExistingProductFromCart({required ProductModel productModel}) async {
    final database = await DatabaseService().database;
    var result = await database.rawQuery(
      'SELECT EXISTS(SELECT 1 FROM $_tableName WHERE id="${productModel.id}")',
    );
    int? exists = Sqflite.firstIntValue(result);
    return exists == 1;
  }

  Future<List<ProductModel>> fetchAllProducts() async {
    final database = await DatabaseService().database;
    final products = await database.rawQuery('''
    SELECT * from $_tableName ''');
    return products.map((e) => ProductModel.fromJson(e)).toList();
  }

  Future<ProductModel> fetchProductById(int id) async {
    final database = await DatabaseService().database;
    final products = await database.rawQuery('''
    SELECT * from $_tableName WHERE id = ?''', [id]);
    return ProductModel.fromJson(products);
  }

  Future<int> deleteProduct(int id) async {
    final database = await DatabaseService().database;
    return await database.rawDelete('''
    DELETE from $_tableName WHERE id = ?''', [id]);
  }
}
