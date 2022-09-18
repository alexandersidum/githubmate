import 'package:githubmate/core/infrastructure/hive_database.dart';
import 'package:githubmate/core/infrastructure/list_extension.dart';
import 'package:githubmate/core/shared/log.dart';
import 'package:githubmate/github/core/infrastructure/github_repo_dto.dart';
import 'package:githubmate/github/core/infrastructure/pagination_config.dart';

class StarredRepoLocalService {
  StarredRepoLocalService();

  Future<void> upsertPage(List<GithubRepoDTO> githubList, int page) async {
    //Restrict if it is more than 20 page to avoid too much data
    if (page > 20) {
      return;
    }
    final mapData =
        githubList.toPagedMap(page, pageLength: PaginationConfig.itemsPerPage);
    await HiveDatabase.putAllData<GithubRepoDTO>(
        boxName: GithubRepoDTO.boxName, data: mapData);
  }

  Future<List<GithubRepoDTO>> readPage(int page) async {
    Log.setLog("Page : $page ", tag: "readPage");
    if (page > 20) {
      Log.setLog("Page : $page , Page execesive > 20", tag: "readPage");
      return [];
    }
    final result = await HiveDatabase.getDataFromBox<GithubRepoDTO>(
        boxName: GithubRepoDTO.boxName);
    if (result == null) {
      Log.setLog("Page : $page , Result is null", tag: "readPage");
      return [];
    }
    Log.setLog("Page : $page , Result unfiltered : ${result.length}",
        tag: "readPage");
    return result
        .skip((page - 1) * PaginationConfig.itemsPerPage)
        .take(PaginationConfig.itemsPerPage)
        .toList();
  }

  Future<int> getMaximumPageCount() async {
    final result = await HiveDatabase.getDataFromBox<GithubRepoDTO>(
        boxName: GithubRepoDTO.boxName);

    final maxPage = (result.length / PaginationConfig.itemsPerPage).ceil();
    Log.setLog("Local Max Page : $maxPage", tag: "getMaximumPageCount");

    return maxPage;
  }
}
