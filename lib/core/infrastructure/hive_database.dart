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

  static Future<T?> getDataFromBoxKey<T>(
      {required String boxName, required String key}) async {
    final data = Hive.box<T>(boxName).get(key);
    return data;
  }

  static Future<void> deleteData<T>(
      {required String boxName, dynamic key}) async {
    final box = Hive.box<T>(boxName);
    await box.delete(key);
  }

  static Future<void> deleteDataAt<T>(
      {required String boxName, required int index}) async {
    final box = Hive.box<T>(boxName);
    await box.deleteAt(index);
  }

  static Future<int> getDataIndex<T>(
      {required String boxName, required T data}) async {
    final box = Hive.box<T>(boxName);

    return box.values.toList().indexOf(data);
  }

  static Future<void> deleteLazyData<T>(
      {required String boxName, dynamic key}) async {
    final box = Hive.lazyBox<T>(boxName);
    await box.delete(key);
  }

  static Stream<Iterable<T>> streamData<T>(String boxName) {
    return Hive.box<T>(boxName).watch().map((event) => event.value);
  }
}
