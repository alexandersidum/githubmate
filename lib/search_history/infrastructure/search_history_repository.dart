import 'package:githubmate/core/infrastructure/hive_database.dart';

class SearchHistoryRepository {
  static const boxName = 'SearchHistory';
  // static const keyName = 'TopList';
  static const historyLength = 8;

  Future<void> addSearchHistory(String keyword) async {
    final historyList =
        (await HiveDatabase.getDataFromBox<String>(boxName: boxName)).toList();
    if (historyList.any((element) => element == keyword)) {
      final index = await HiveDatabase.getDataIndex<String>(
          boxName: boxName, data: keyword);
      await HiveDatabase.deleteDataAt<String>(boxName: boxName, index: index);
    }
    await HiveDatabase.addData(boxName: boxName, data: keyword);
  }

  Future<void> deleteSearchHistory(String keyword) async {
    final historyList =
        (await HiveDatabase.getDataFromBox<String>(boxName: boxName)).toList();
    if (historyList.any((element) => element == keyword)) {
      final index = await HiveDatabase.getDataIndex<String>(
          boxName: boxName, data: keyword);
      await HiveDatabase.deleteDataAt<String>(boxName: boxName, index: index);
    }
  }

  // Future<List<String>> getSearchHistoryData() async {
  //   final dataList = await HiveDatabase.getDataFromBoxKey<List<String>>(
  //       boxName: boxName, key: keyName);
  //   return dataList ?? [];
  // }

  Stream<List<String>> streamSearchHistoryData({String? keyword}) {
    return HiveDatabase.streamData<String>(boxName).map((event) {
      var list = event.toList();
      if (keyword?.isNotEmpty ?? false) {
        list = event
            .where((element) => element.toLowerCase().contains(keyword!))
            .toList();
      }
      return list.reversed.take(historyLength).toList();
    });
  }
}
