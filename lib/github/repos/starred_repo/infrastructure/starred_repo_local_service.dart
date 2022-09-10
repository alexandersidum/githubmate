import 'package:githubmate/core/infrastructure/hive_database.dart';
import 'package:githubmate/core/infrastructure/list_extension.dart';
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
    if (page > 20) {
      return [];
    }
    final result = await HiveDatabase.getDataFromBox<GithubRepoDTO>(
        boxName: GithubRepoDTO.boxName);

    return result
            ?.take(PaginationConfig.itemsPerPage)
            .skip(page * PaginationConfig.itemsPerPage)
            .toList() ??
        [];
  }
}
