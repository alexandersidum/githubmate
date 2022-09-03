// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'github_repo_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GithubRepoDTO _$GithubRepoDTOFromJson(Map<String, dynamic> json) {
  return _GithubRepoDTO.fromJson(json);
}

/// @nodoc
mixin _$GithubRepoDTO {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  UserDTO get owner => throw _privateConstructorUsedError;
  @HiveField(2)
  String get name => throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: 'description', defaultValue: '')
  String get description => throw _privateConstructorUsedError;
  @HiveField(4)
  @JsonKey(name: 'stargazers_count')
  int get stargazerCount => throw _privateConstructorUsedError;
  @HiveField(5)
  String get language => throw _privateConstructorUsedError;
  @HiveField(6)
  String get visibility => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GithubRepoDTOCopyWith<GithubRepoDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GithubRepoDTOCopyWith<$Res> {
  factory $GithubRepoDTOCopyWith(
          GithubRepoDTO value, $Res Function(GithubRepoDTO) then) =
      _$GithubRepoDTOCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0)
          String id,
      @HiveField(1)
          UserDTO owner,
      @HiveField(2)
          String name,
      @HiveField(3)
      @JsonKey(name: 'description', defaultValue: '')
          String description,
      @HiveField(4)
      @JsonKey(name: 'stargazers_count')
          int stargazerCount,
      @HiveField(5)
          String language,
      @HiveField(6)
          String visibility});

  $UserDTOCopyWith<$Res> get owner;
}

/// @nodoc
class _$GithubRepoDTOCopyWithImpl<$Res>
    implements $GithubRepoDTOCopyWith<$Res> {
  _$GithubRepoDTOCopyWithImpl(this._value, this._then);

  final GithubRepoDTO _value;
  // ignore: unused_field
  final $Res Function(GithubRepoDTO) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? owner = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? stargazerCount = freezed,
    Object? language = freezed,
    Object? visibility = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      owner: owner == freezed
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as UserDTO,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      stargazerCount: stargazerCount == freezed
          ? _value.stargazerCount
          : stargazerCount // ignore: cast_nullable_to_non_nullable
              as int,
      language: language == freezed
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      visibility: visibility == freezed
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $UserDTOCopyWith<$Res> get owner {
    return $UserDTOCopyWith<$Res>(_value.owner, (value) {
      return _then(_value.copyWith(owner: value));
    });
  }
}

/// @nodoc
abstract class _$$_GithubRepoDTOCopyWith<$Res>
    implements $GithubRepoDTOCopyWith<$Res> {
  factory _$$_GithubRepoDTOCopyWith(
          _$_GithubRepoDTO value, $Res Function(_$_GithubRepoDTO) then) =
      __$$_GithubRepoDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0)
          String id,
      @HiveField(1)
          UserDTO owner,
      @HiveField(2)
          String name,
      @HiveField(3)
      @JsonKey(name: 'description', defaultValue: '')
          String description,
      @HiveField(4)
      @JsonKey(name: 'stargazers_count')
          int stargazerCount,
      @HiveField(5)
          String language,
      @HiveField(6)
          String visibility});

  @override
  $UserDTOCopyWith<$Res> get owner;
}

/// @nodoc
class __$$_GithubRepoDTOCopyWithImpl<$Res>
    extends _$GithubRepoDTOCopyWithImpl<$Res>
    implements _$$_GithubRepoDTOCopyWith<$Res> {
  __$$_GithubRepoDTOCopyWithImpl(
      _$_GithubRepoDTO _value, $Res Function(_$_GithubRepoDTO) _then)
      : super(_value, (v) => _then(v as _$_GithubRepoDTO));

  @override
  _$_GithubRepoDTO get _value => super._value as _$_GithubRepoDTO;

  @override
  $Res call({
    Object? id = freezed,
    Object? owner = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? stargazerCount = freezed,
    Object? language = freezed,
    Object? visibility = freezed,
  }) {
    return _then(_$_GithubRepoDTO(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      owner: owner == freezed
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as UserDTO,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      stargazerCount: stargazerCount == freezed
          ? _value.stargazerCount
          : stargazerCount // ignore: cast_nullable_to_non_nullable
              as int,
      language: language == freezed
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      visibility: visibility == freezed
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 1, adapterName: 'GithubRepoDTOAdapter')
class _$_GithubRepoDTO extends _GithubRepoDTO {
  const _$_GithubRepoDTO(
      {@HiveField(0)
          required this.id,
      @HiveField(1)
          required this.owner,
      @HiveField(2)
          required this.name,
      @HiveField(3)
      @JsonKey(name: 'description', defaultValue: '')
          required this.description,
      @HiveField(4)
      @JsonKey(name: 'stargazers_count')
          required this.stargazerCount,
      @HiveField(5)
          required this.language,
      @HiveField(6)
          required this.visibility})
      : super._();

  factory _$_GithubRepoDTO.fromJson(Map<String, dynamic> json) =>
      _$$_GithubRepoDTOFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final UserDTO owner;
  @override
  @HiveField(2)
  final String name;
  @override
  @HiveField(3)
  @JsonKey(name: 'description', defaultValue: '')
  final String description;
  @override
  @HiveField(4)
  @JsonKey(name: 'stargazers_count')
  final int stargazerCount;
  @override
  @HiveField(5)
  final String language;
  @override
  @HiveField(6)
  final String visibility;

  @override
  String toString() {
    return 'GithubRepoDTO(id: $id, owner: $owner, name: $name, description: $description, stargazerCount: $stargazerCount, language: $language, visibility: $visibility)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GithubRepoDTO &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.owner, owner) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality()
                .equals(other.stargazerCount, stargazerCount) &&
            const DeepCollectionEquality().equals(other.language, language) &&
            const DeepCollectionEquality()
                .equals(other.visibility, visibility));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(owner),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(stargazerCount),
      const DeepCollectionEquality().hash(language),
      const DeepCollectionEquality().hash(visibility));

  @JsonKey(ignore: true)
  @override
  _$$_GithubRepoDTOCopyWith<_$_GithubRepoDTO> get copyWith =>
      __$$_GithubRepoDTOCopyWithImpl<_$_GithubRepoDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GithubRepoDTOToJson(
      this,
    );
  }
}

abstract class _GithubRepoDTO extends GithubRepoDTO {
  const factory _GithubRepoDTO(
      {@HiveField(0)
          required final String id,
      @HiveField(1)
          required final UserDTO owner,
      @HiveField(2)
          required final String name,
      @HiveField(3)
      @JsonKey(name: 'description', defaultValue: '')
          required final String description,
      @HiveField(4)
      @JsonKey(name: 'stargazers_count')
          required final int stargazerCount,
      @HiveField(5)
          required final String language,
      @HiveField(6)
          required final String visibility}) = _$_GithubRepoDTO;
  const _GithubRepoDTO._() : super._();

  factory _GithubRepoDTO.fromJson(Map<String, dynamic> json) =
      _$_GithubRepoDTO.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  UserDTO get owner;
  @override
  @HiveField(2)
  String get name;
  @override
  @HiveField(3)
  @JsonKey(name: 'description', defaultValue: '')
  String get description;
  @override
  @HiveField(4)
  @JsonKey(name: 'stargazers_count')
  int get stargazerCount;
  @override
  @HiveField(5)
  String get language;
  @override
  @HiveField(6)
  String get visibility;
  @override
  @JsonKey(ignore: true)
  _$$_GithubRepoDTOCopyWith<_$_GithubRepoDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
