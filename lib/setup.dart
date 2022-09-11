import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'github/core/infrastructure/github_headers.dart';
import 'github/core/infrastructure/github_repo_dto.dart';
import 'github/core/infrastructure/user_dto.dart';

Future<void> initializeHive() async {
  if (kIsWeb) {
    await Hive.initFlutter();
  } else {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    Hive.init(
      appDocumentDir.path,
    );
  }
  Hive.registerAdapter(PaginationLinkAdapter());
  Hive.registerAdapter(GithubHeadersAdapter());
  Hive.registerAdapter(UserDTOAdapter());
  Hive.registerAdapter(GithubRepoDTOAdapter());

  await Hive.openLazyBox<GithubHeaders>(GithubHeaders.boxName);
  await Hive.openLazyBox<UserDTO>(UserDTO.boxName);
  await Hive.openBox<GithubRepoDTO>(GithubRepoDTO.boxName);
}
