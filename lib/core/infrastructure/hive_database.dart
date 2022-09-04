import 'package:hive/hive.dart';

class HiveDatabase {
  static Future<void> putData<T>(
      {required String boxName,
      required String key,
      required dynamic data}) async {
    final box = Hive.lazyBox<T>(boxName);
    await box.put(key, data);
  }

  static Future<void> addData<T>(
      {required String boxName, required dynamic data}) async {
    final box = Hive.lazyBox<T>(boxName);
    await box.add(data);
  }

  static Future<T?> getData<T>({required String boxName, String? key}) async {
    final box = Hive.lazyBox<T>(boxName);
    final output = box.get(key);
    return output;
  }

  static Future<void> deleteData<T>(
      {required String boxName, String? key}) async {
    final box = Hive.lazyBox<T>(boxName);
    await box.delete(key);
  }
}
