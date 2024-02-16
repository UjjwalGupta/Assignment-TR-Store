import 'package:sqflite/sqflite.dart';
import 'package:tr_store/data/database/database_service.dart';
import 'package:tr_store/models/product_list/ProductModel.dart';

class CartProductsDB {
  final tableName = "Cart_Products";

  Future<void> createTable(Database database) async {
    await database.execute("""
    CREATE TABLE IF NOT EXISTS $tableName (
    "id" INTEGER NOT NULL,
    "title" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "image" TEXT NOT NULL,
    PRIMARY KEY("id" AUTOINCREMENT)
    );""");
  }

  Future<int> create({required ProductModel productModel}) async {
    final database = await DatabaseService().database;
    return await database.rawInsert(
      '''INSERT INTO $tableName (title, content, image) VALUES (?,?,?)''',
      [productModel.title, productModel.content, productModel.thumbnail],
    );
  }

  Future<List<ProductModel>> fetchAllProducts() async {
    final database = await DatabaseService().database;
    final products = await database.rawQuery('''
    SELECT * from $tableName ''');
    return products.map((e) => ProductModel.fromJson(e)).toList();
  }

  Future<ProductModel> fetchProductById(int id) async {
    final database = await DatabaseService().database;
    final products = await database.rawQuery('''
    SELECT * from $tableName WHERE id = ?''', [id]);
    return ProductModel.fromJson(products);
  }

  Future<void> deleteProduct(int id) async {
    final database = await DatabaseService().database;
    final products = await database.rawDelete('''
    DELETE from $tableName WHERE id = ?''', [id]);
  }
}
