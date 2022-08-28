import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:githubmate/github/core/domain/github_repo.dart';
import 'package:githubmate/github/core/infrastructure/user_dto.dart';

part 'github_repo_dto.freezed.dart';
part 'github_repo_dto.g.dart';

@freezed
class GithubRepoDTO with _$GithubRepoDTO {
  const GithubRepoDTO._();
  const factory GithubRepoDTO({
    required String id,
    required UserDTO owner,
    required String name,
    @JsonKey(name: 'description', defaultValue: '') required String description,
    @JsonKey(name: 'stargazers_count') required int stargazerCount,
    required String language,
    required String visibility,
  }) = _GithubRepoDTO;

  factory GithubRepoDTO.fromJson(Map<String, dynamic> json) =>
      _$GithubRepoDTOFromJson(json);

  factory GithubRepoDTO.fromDomain(GithubRepo domain) => GithubRepoDTO(
      id: domain.id,
      owner: UserDTO.fromDomain(domain.owner),
      name: domain.name,
      description: domain.description,
      stargazerCount: domain.stargazerCount,
      language: domain.language,
      visibility: domain.visibility);

  GithubRepo toDomain() => GithubRepo(
      id: id,
      owner: owner.toDomain(),
      name: name,
      description: description,
      stargazerCount: stargazerCount,
      language: language,
      visibility: visibility);
}