import 'package:hive/hive.dart';

class HiveDatabase {
  static Future<void> putLazyData<T>(
      {required String boxName,
      required dynamic key,
      required dynamic data}) async {
    final box = Hive.lazyBox<T>(boxName);
    await box.put(key, data);
  }

  static Future<void> putData<T>(
      {required String boxName,
      required dynamic key,
      required dynamic data}) async {
    final box = Hive.box<T>(boxName);
    await box.put(key, data);
  }

  static Future<void> putLazyAllData<T>(
      {required String boxName, required Map<dynamic, T> data}) async {
    final box = Hive.lazyBox<T>(boxName);
    await box.putAll(data);
  }

  static Future<void> putAllData<T>(
      {required String boxName, required Map<dynamic, T> data}) async {
    final box = Hive.box<T>(boxName);
    await box.putAll(data);
  }

  static Future<void> addData<T>(
      {required String boxName, required dynamic data}) async {
    final box = Hive.box<T>(boxName);
    await box.add(data);
  }

  static Future<void> addLazyData<T>(
      {required String boxName, required dynamic data}) async {
    final box = Hive.lazyBox<T>(boxName);
    await box.add(data);
  }

  static Future<T?> getLazyData<T>(
      {required String boxName, dynamic key}) async {
    final box = Hive.lazyBox<T>(boxName);
    final output = box.get(key);
    return output;
  }

  static Future<Iterable<T>> getDataFromBox<T>(
      {required String boxName}) async {
    final box = Hive.box<T>(boxName);
    return box.values;
  }

  static Future<void> deleteData<T>(
      {required String boxName, dynamic key}) async {
    final box = Hive.box<T>(boxName);
    await box.delete(key);
  }

  static Future<void> deleteLazyData<T>(
      {required String boxName, dynamic key}) async {
    final box = Hive.lazyBox<T>(boxName);
    await box.delete(key);
  }
}
