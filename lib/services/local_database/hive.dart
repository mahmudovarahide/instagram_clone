import 'package:hive_flutter/adapters.dart';
import 'package:instagram_app/data/auth/model/model.dart';
import 'package:instagram_app/services/local_database/local_database.dart';

class HiveService implements LocalDatabase {
  late Box<dynamic> _box;

  @override
  Future<void> init([String? boxName]) async {
    await Hive.initFlutter('app');
    await registerAdapters();
    _box = await Hive.openBox(boxName ?? 'cache');
  }

  @override
  void delete(String key) async {
    _box.delete(key);
  }

  @override
  get(String key) {
    return _box.get(key);
  }

  @override
  void store(String key, dynamic value) async {
    await _box.put(key, value);
  }

  void storeList(String boxName, dynamic item) async {
    var box = await Hive.openBox(boxName);
    box.add(item);
  }

  Future<List<dynamic>> getList(String boxName) async {
    final box = Hive.box(boxName);
    final List<dynamic> items = box.values.toList().cast<dynamic>();
    return items;
  }

  @override
  void update(String key, value) async {
    await _box.put(key, value);
  }

  Box<dynamic> getBox(String? boxName) {
    if (boxName != null) {
      return Hive.box(boxName);
    }
    return _box;
  }

  static registerAdapters() {
    Hive.registerAdapter(UserModelAdapter());
  }
}
