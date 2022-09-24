// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_repo_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GithubRepoDTOAdapter extends TypeAdapter<_$_GithubRepoDTO> {
  @override
  final int typeId = 1;

  @override
  _$_GithubRepoDTO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_GithubRepoDTO(
      id: fields[0] as int,
      owner: fields[1] as UserDTO,
      name: fields[2] as String,
      description: fields[3] as String,
      stargazerCount: fields[4] as int,
      language: fields[5] as String?,
      visibility: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$_GithubRepoDTO obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.owner)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.stargazerCount)
      ..writeByte(5)
      ..write(obj.language)
      ..writeByte(6)
      ..write(obj.visibility);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GithubRepoDTOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GithubRepoDTO _$$_GithubRepoDTOFromJson(Map<String, dynamic> json) =>
    _$_GithubRepoDTO(
      id: json['id'] as int,
      owner: UserDTO.fromJson(json['owner'] as Map<String, dynamic>),
      name: json['name'] as String,
      description: json['description'] as String? ?? '',
      stargazerCount: json['stargazers_count'] as int,
      language: json['language'] as String?,
      visibility: json['visibility'] as String,
    );

Map<String, dynamic> _$$_GithubRepoDTOToJson(_$_GithubRepoDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner': instance.owner.toJson(),
      'name': instance.name,
      'description': instance.description,
      'stargazers_count': instance.stargazerCount,
      'language': instance.language,
      'visibility': instance.visibility,
    };
