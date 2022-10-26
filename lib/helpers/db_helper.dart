import 'package:ecommerce/models/cart_product_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static final DbHelper _instance = DbHelper.internal();
  factory DbHelper() => _instance;
  DbHelper.internal();
  static Database? _db;

  createDatabase() async {
    if (_db != null) {
      return _db;
    }
    String Path = join(await getDatabasesPath(), 'cart.db');
    _db = await openDatabase(Path, version: 1, onCreate: (db, version) {
      db.execute(
          'CREATE TABLE products(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,name TEXT ,image TEXT ,price INTEGER , count INTEGER)');
    });
    return _db;
  }

  Future<int> createProduct(CartProductModel model) async {
    Database db = await createDatabase();
    return db.insert('products', model.toMap()).then((value) {
      print('the id is $value');
      return value;
    });
  }

  Future<List<Map<String, Object?>>> allProducts() async {
    Database db = await createDatabase();
    return db.query('products');
  }

  Future<int> delete(int id) async {
    Database db = await createDatabase();
    return db.delete('products', where: 'id = ?', whereArgs: [id]);
  }

  void clearTable() async {
    Database db = await createDatabase();
    db.execute('delete from products');
  }

  Future<int> update(CartProductModel model) async {
    Database db = await createDatabase();
    return db.update('products', model.toMap(),
        where: 'id = ?', whereArgs: [model.id]);
  }
}
