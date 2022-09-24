import '../../core/application/pagination_state_notifier.dart';
import '../infrastructure/searched_repo_repository.dart';

class SearchedRepoStateNotifier extends PaginatedRepoNotifier {
  SearchedRepoStateNotifier(this._repository);

  final SearchedRepoRepository _repository;

  Future<void> getNextSearchedRepoPage(String keyword) async {
    await getNextRepoPage(
        (page) => _repository.getSearchedRepoPage(keyword, page));
  }
}
