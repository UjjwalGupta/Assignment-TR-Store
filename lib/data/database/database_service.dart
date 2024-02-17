import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:tr_store/data/database/cart_products_db.dart';

class DatabaseService {
  Database? _database;

  final _cartDB = CartProductsDB.instance;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initialize();
    return _database!;
  }

  Future<String> get fullPath async {
    const name = 'cart_products.bd';
    final path = await getDatabasesPath();
    return join(path, name);
  }

  Future<Database> _initialize() async {
    final path = await fullPath;
    var database = await openDatabase(
        path,
        version: 1,
        onCreate: create,
        singleInstance: true);
    return database;
  }

  Future<void> create(Database database, int version) async =>
      await _cartDB.createTable(database);
}
