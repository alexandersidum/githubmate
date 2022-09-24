import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:githubmate/github/core/domain/user.dart';

part 'github_repo.freezed.dart';

@freezed
class GithubRepo with _$GithubRepo {
  const GithubRepo._();
  const factory GithubRepo({
    required int id,
    required User owner,
    required String name,
    required String description,
    required int stargazerCount,
    required String? language,
    required String visibility,
  }) = _GithubRepo;
}
