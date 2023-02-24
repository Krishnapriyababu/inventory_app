

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/category_model.dart';
import '../models/product_model.dart';

class DbHelper {
  static const _databaseName = "inventory.db";
  static const _databaseVersion = 1;

  DbHelper._privateConstructor();
  static final DbHelper instance = DbHelper._privateConstructor();
  static const categoryTable = "CategoryData";
  static const productTable = "ProductsData";
  static Database? _database;
  static final columnId = 'category_name';

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }
  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    // String path = join()
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE $categoryTable(category_id TEXT PRIMARY KEY, category_name TEXT,imageurl TEXT)");
    await db.execute("CREATE TABLE $productTable(product_id TEXT PRIMARY KEY , product_name TEXT,product_rate INTEGER, product_image TEXT, category_id TEXT)");
  }
  Future<int> insertCategory(CategoryModel categoryModel) async {

    Database? db = await instance.database;
    var res = await db!.insert(categoryTable, categoryModel.toJson());
    return res;
  }
  Future<int> insertProducts(Products productModel) async {

    Database? db = await instance.database;
    var res = await db!.insert(productTable, productModel.toJson());
    return res;
  }
  // Read all items (journals)
  static Future<Future<List<Map<String, Object?>>>?> getItems() async {
    final db = await DbHelper._database;
    return db?.query(categoryTable);
  }



}