// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'github_repo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GithubRepo {
  int get id => throw _privateConstructorUsedError;
  User get owner => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get stargazerCount => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;
  String get visibility => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GithubRepoCopyWith<GithubRepo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GithubRepoCopyWith<$Res> {
  factory $GithubRepoCopyWith(
          GithubRepo value, $Res Function(GithubRepo) then) =
      _$GithubRepoCopyWithImpl<$Res>;
  $Res call(
      {int id,
      User owner,
      String name,
      String description,
      int stargazerCount,
      String language,
      String visibility});

  $UserCopyWith<$Res> get owner;
}

/// @nodoc
class _$GithubRepoCopyWithImpl<$Res> implements $GithubRepoCopyWith<$Res> {
  _$GithubRepoCopyWithImpl(this._value, this._then);

  final GithubRepo _value;
  // ignore: unused_field
  final $Res Function(GithubRepo) _then;

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
              as int,
      owner: owner == freezed
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as User,
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
  $UserCopyWith<$Res> get owner {
    return $UserCopyWith<$Res>(_value.owner, (value) {
      return _then(_value.copyWith(owner: value));
    });
  }
}

/// @nodoc
abstract class _$$_GithubRepoCopyWith<$Res>
    implements $GithubRepoCopyWith<$Res> {
  factory _$$_GithubRepoCopyWith(
          _$_GithubRepo value, $Res Function(_$_GithubRepo) then) =
      __$$_GithubRepoCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      User owner,
      String name,
      String description,
      int stargazerCount,
      String language,
      String visibility});

  @override
  $UserCopyWith<$Res> get owner;
}

/// @nodoc
class __$$_GithubRepoCopyWithImpl<$Res> extends _$GithubRepoCopyWithImpl<$Res>
    implements _$$_GithubRepoCopyWith<$Res> {
  __$$_GithubRepoCopyWithImpl(
      _$_GithubRepo _value, $Res Function(_$_GithubRepo) _then)
      : super(_value, (v) => _then(v as _$_GithubRepo));

  @override
  _$_GithubRepo get _value => super._value as _$_GithubRepo;

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
    return _then(_$_GithubRepo(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      owner: owner == freezed
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as User,
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

class _$_GithubRepo extends _GithubRepo {
  const _$_GithubRepo(
      {required this.id,
      required this.owner,
      required this.name,
      required this.description,
      required this.stargazerCount,
      required this.language,
      required this.visibility})
      : super._();

  @override
  final int id;
  @override
  final User owner;
  @override
  final String name;
  @override
  final String description;
  @override
  final int stargazerCount;
  @override
  final String language;
  @override
  final String visibility;

  @override
  String toString() {
    return 'GithubRepo(id: $id, owner: $owner, name: $name, description: $description, stargazerCount: $stargazerCount, language: $language, visibility: $visibility)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GithubRepo &&
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
  _$$_GithubRepoCopyWith<_$_GithubRepo> get copyWith =>
      __$$_GithubRepoCopyWithImpl<_$_GithubRepo>(this, _$identity);
}

abstract class _GithubRepo extends GithubRepo {
  const factory _GithubRepo(
      {required final int id,
      required final User owner,
      required final String name,
      required final String description,
      required final int stargazerCount,
      required final String language,
      required final String visibility}) = _$_GithubRepo;
  const _GithubRepo._() : super._();

  @override
  int get id;
  @override
  User get owner;
  @override
  String get name;
  @override
  String get description;
  @override
  int get stargazerCount;
  @override
  String get language;
  @override
  String get visibility;
  @override
  @JsonKey(ignore: true)
  _$$_GithubRepoCopyWith<_$_GithubRepo> get copyWith =>
      throw _privateConstructorUsedError;
}
