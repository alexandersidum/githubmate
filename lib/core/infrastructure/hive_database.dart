import 'package:githubmate/core/infrastructure/local_database.dart';
import 'package:githubmate/github/core/infrastructure/github_repo_dto.dart';
import 'package:githubmate/github/core/infrastructure/user_dto.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveDatabase extends LocalDatabase {
  @override
  Future<void> init() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    Hive.init(
      appDocumentDir.path,
    );
    Hive.registerAdapter(UserDTOAdapter());
    Hive.registerAdapter(GithubRepoDTOAdapter());
  }
}
