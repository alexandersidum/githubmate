// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_repo_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GithubRepoDTO _$$_GithubRepoDTOFromJson(Map<String, dynamic> json) =>
    _$_GithubRepoDTO(
      id: json['id'] as String,
      owner: UserDTO.fromJson(json['owner'] as Map<String, dynamic>),
      name: json['name'] as String,
      description: json['description'] as String? ?? '',
      stargazerCount: json['stargazers_count'] as int,
      language: json['language'] as String,
      visibility: json['visibility'] as String,
    );

Map<String, dynamic> _$$_GithubRepoDTOToJson(_$_GithubRepoDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner': instance.owner,
      'name': instance.name,
      'description': instance.description,
      'stargazers_count': instance.stargazerCount,
      'language': instance.language,
      'visibility': instance.visibility,
    };
