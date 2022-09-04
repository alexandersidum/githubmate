// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:githubmate/core/infrastructure/hive_database.dart';
import 'package:githubmate/core/shared/log.dart';
import 'package:githubmate/github/core/infrastructure/github_headers.dart';

class GithubHeadersCache {
  GithubHeadersCache();

  Future<void> saveHeader(Uri uri, GithubHeaders headers) async {
    try {
      await HiveDatabase.putData<GithubHeaders>(
          boxName: GithubHeaders.boxName, key: uri.toString(), data: headers);
    } catch (e) {
      Log.setLog("Error saveHeader $e");
    }
  }

  Future<GithubHeaders?> getHeader(Uri uri) async {
    try {
      final header = await HiveDatabase.getData<GithubHeaders>(
          boxName: GithubHeaders.boxName, key: uri.toString());
      Log.setLog("GithubHeader => $header");
      return header;
    } catch (e) {
      Log.setLog("Error getHeader $e");
      return null;
    }
  }

  Future<void> deleteHeader(Uri uri) async {
    try {
      await HiveDatabase.deleteData(
          boxName: GithubHeaders.boxName, key: uri.toString());
    } catch (e) {
      Log.setLog("Error deleteHeader $e");
    }
  }
}
