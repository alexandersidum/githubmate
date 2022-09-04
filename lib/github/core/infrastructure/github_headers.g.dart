// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_headers.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GithubHeadersAdapter extends TypeAdapter<_$_GithubHeaders> {
  @override
  final int typeId = 2;

  @override
  _$_GithubHeaders read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_GithubHeaders(
      etag: fields[0] as String?,
      link: fields[1] as PaginationLink?,
    );
  }

  @override
  void write(BinaryWriter writer, _$_GithubHeaders obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.etag)
      ..writeByte(1)
      ..write(obj.link);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GithubHeadersAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PaginationLinkAdapter extends TypeAdapter<_$_PaginationLink> {
  @override
  final int typeId = 3;

  @override
  _$_PaginationLink read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_PaginationLink(
      maxPage: fields[0] as int,
    );
  }

  @override
  void write(BinaryWriter writer, _$_PaginationLink obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.maxPage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PaginationLinkAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GithubHeaders _$$_GithubHeadersFromJson(Map<String, dynamic> json) =>
    _$_GithubHeaders(
      etag: json['etag'] as String?,
      link: json['link'] == null
          ? null
          : PaginationLink.fromJson(json['link'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_GithubHeadersToJson(_$_GithubHeaders instance) =>
    <String, dynamic>{
      'etag': instance.etag,
      'link': instance.link,
    };

_$_PaginationLink _$$_PaginationLinkFromJson(Map<String, dynamic> json) =>
    _$_PaginationLink(
      maxPage: json['maxPage'] as int,
    );

Map<String, dynamic> _$$_PaginationLinkToJson(_$_PaginationLink instance) =>
    <String, dynamic>{
      'maxPage': instance.maxPage,
    };
