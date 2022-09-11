// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'starred_repo_state_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StarredRepoState {
  Fresh<List<GithubRepo>> get repoList => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Fresh<List<GithubRepo>> repoList) initial,
    required TResult Function(Fresh<List<GithubRepo>> repoList, int itemPerPage)
        loading,
    required TResult Function(Fresh<List<GithubRepo>> repoList) loadSuccess,
    required TResult Function(
            Fresh<List<GithubRepo>> repoList, GithubFailure failure)
        loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Fresh<List<GithubRepo>> repoList)? initial,
    TResult Function(Fresh<List<GithubRepo>> repoList, int itemPerPage)?
        loading,
    TResult Function(Fresh<List<GithubRepo>> repoList)? loadSuccess,
    TResult Function(Fresh<List<GithubRepo>> repoList, GithubFailure failure)?
        loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<List<GithubRepo>> repoList)? initial,
    TResult Function(Fresh<List<GithubRepo>> repoList, int itemPerPage)?
        loading,
    TResult Function(Fresh<List<GithubRepo>> repoList)? loadSuccess,
    TResult Function(Fresh<List<GithubRepo>> repoList, GithubFailure failure)?
        loadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StarredRepoStateCopyWith<StarredRepoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StarredRepoStateCopyWith<$Res> {
  factory $StarredRepoStateCopyWith(
          StarredRepoState value, $Res Function(StarredRepoState) then) =
      _$StarredRepoStateCopyWithImpl<$Res>;
  $Res call({Fresh<List<GithubRepo>> repoList});

  $FreshCopyWith<List<GithubRepo>, $Res> get repoList;
}

/// @nodoc
class _$StarredRepoStateCopyWithImpl<$Res>
    implements $StarredRepoStateCopyWith<$Res> {
  _$StarredRepoStateCopyWithImpl(this._value, this._then);

  final StarredRepoState _value;
  // ignore: unused_field
  final $Res Function(StarredRepoState) _then;

  @override
  $Res call({
    Object? repoList = freezed,
  }) {
    return _then(_value.copyWith(
      repoList: repoList == freezed
          ? _value.repoList
          : repoList // ignore: cast_nullable_to_non_nullable
              as Fresh<List<GithubRepo>>,
    ));
  }

  @override
  $FreshCopyWith<List<GithubRepo>, $Res> get repoList {
    return $FreshCopyWith<List<GithubRepo>, $Res>(_value.repoList, (value) {
      return _then(_value.copyWith(repoList: value));
    });
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res>
    implements $StarredRepoStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  $Res call({Fresh<List<GithubRepo>> repoList});

  @override
  $FreshCopyWith<List<GithubRepo>, $Res> get repoList;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$StarredRepoStateCopyWithImpl<$Res>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, (v) => _then(v as _$_Initial));

  @override
  _$_Initial get _value => super._value as _$_Initial;

  @override
  $Res call({
    Object? repoList = freezed,
  }) {
    return _then(_$_Initial(
      repoList: repoList == freezed
          ? _value.repoList
          : repoList // ignore: cast_nullable_to_non_nullable
              as Fresh<List<GithubRepo>>,
    ));
  }
}

/// @nodoc

class _$_Initial extends _Initial {
  const _$_Initial({required this.repoList}) : super._();

  @override
  final Fresh<List<GithubRepo>> repoList;

  @override
  String toString() {
    return 'StarredRepoState.initial(repoList: $repoList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            const DeepCollectionEquality().equals(other.repoList, repoList));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(repoList));

  @JsonKey(ignore: true)
  @override
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Fresh<List<GithubRepo>> repoList) initial,
    required TResult Function(Fresh<List<GithubRepo>> repoList, int itemPerPage)
        loading,
    required TResult Function(Fresh<List<GithubRepo>> repoList) loadSuccess,
    required TResult Function(
            Fresh<List<GithubRepo>> repoList, GithubFailure failure)
        loadFailure,
  }) {
    return initial(repoList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Fresh<List<GithubRepo>> repoList)? initial,
    TResult Function(Fresh<List<GithubRepo>> repoList, int itemPerPage)?
        loading,
    TResult Function(Fresh<List<GithubRepo>> repoList)? loadSuccess,
    TResult Function(Fresh<List<GithubRepo>> repoList, GithubFailure failure)?
        loadFailure,
  }) {
    return initial?.call(repoList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<List<GithubRepo>> repoList)? initial,
    TResult Function(Fresh<List<GithubRepo>> repoList, int itemPerPage)?
        loading,
    TResult Function(Fresh<List<GithubRepo>> repoList)? loadSuccess,
    TResult Function(Fresh<List<GithubRepo>> repoList, GithubFailure failure)?
        loadFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(repoList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial extends StarredRepoState {
  const factory _Initial({required final Fresh<List<GithubRepo>> repoList}) =
      _$_Initial;
  const _Initial._() : super._();

  @override
  Fresh<List<GithubRepo>> get repoList;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadingCopyWith<$Res>
    implements $StarredRepoStateCopyWith<$Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading value, $Res Function(_$_Loading) then) =
      __$$_LoadingCopyWithImpl<$Res>;
  @override
  $Res call({Fresh<List<GithubRepo>> repoList, int itemPerPage});

  @override
  $FreshCopyWith<List<GithubRepo>, $Res> get repoList;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<$Res>
    extends _$StarredRepoStateCopyWithImpl<$Res>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, (v) => _then(v as _$_Loading));

  @override
  _$_Loading get _value => super._value as _$_Loading;

  @override
  $Res call({
    Object? repoList = freezed,
    Object? itemPerPage = freezed,
  }) {
    return _then(_$_Loading(
      repoList: repoList == freezed
          ? _value.repoList
          : repoList // ignore: cast_nullable_to_non_nullable
              as Fresh<List<GithubRepo>>,
      itemPerPage: itemPerPage == freezed
          ? _value.itemPerPage
          : itemPerPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Loading extends _Loading {
  const _$_Loading({required this.repoList, required this.itemPerPage})
      : super._();

  @override
  final Fresh<List<GithubRepo>> repoList;
  @override
  final int itemPerPage;

  @override
  String toString() {
    return 'StarredRepoState.loading(repoList: $repoList, itemPerPage: $itemPerPage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Loading &&
            const DeepCollectionEquality().equals(other.repoList, repoList) &&
            const DeepCollectionEquality()
                .equals(other.itemPerPage, itemPerPage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(repoList),
      const DeepCollectionEquality().hash(itemPerPage));

  @JsonKey(ignore: true)
  @override
  _$$_LoadingCopyWith<_$_Loading> get copyWith =>
      __$$_LoadingCopyWithImpl<_$_Loading>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Fresh<List<GithubRepo>> repoList) initial,
    required TResult Function(Fresh<List<GithubRepo>> repoList, int itemPerPage)
        loading,
    required TResult Function(Fresh<List<GithubRepo>> repoList) loadSuccess,
    required TResult Function(
            Fresh<List<GithubRepo>> repoList, GithubFailure failure)
        loadFailure,
  }) {
    return loading(repoList, itemPerPage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Fresh<List<GithubRepo>> repoList)? initial,
    TResult Function(Fresh<List<GithubRepo>> repoList, int itemPerPage)?
        loading,
    TResult Function(Fresh<List<GithubRepo>> repoList)? loadSuccess,
    TResult Function(Fresh<List<GithubRepo>> repoList, GithubFailure failure)?
        loadFailure,
  }) {
    return loading?.call(repoList, itemPerPage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<List<GithubRepo>> repoList)? initial,
    TResult Function(Fresh<List<GithubRepo>> repoList, int itemPerPage)?
        loading,
    TResult Function(Fresh<List<GithubRepo>> repoList)? loadSuccess,
    TResult Function(Fresh<List<GithubRepo>> repoList, GithubFailure failure)?
        loadFailure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(repoList, itemPerPage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading extends StarredRepoState {
  const factory _Loading(
      {required final Fresh<List<GithubRepo>> repoList,
      required final int itemPerPage}) = _$_Loading;
  const _Loading._() : super._();

  @override
  Fresh<List<GithubRepo>> get repoList;
  int get itemPerPage;
  @override
  @JsonKey(ignore: true)
  _$$_LoadingCopyWith<_$_Loading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadSuccessCopyWith<$Res>
    implements $StarredRepoStateCopyWith<$Res> {
  factory _$$_LoadSuccessCopyWith(
          _$_LoadSuccess value, $Res Function(_$_LoadSuccess) then) =
      __$$_LoadSuccessCopyWithImpl<$Res>;
  @override
  $Res call({Fresh<List<GithubRepo>> repoList});

  @override
  $FreshCopyWith<List<GithubRepo>, $Res> get repoList;
}

/// @nodoc
class __$$_LoadSuccessCopyWithImpl<$Res>
    extends _$StarredRepoStateCopyWithImpl<$Res>
    implements _$$_LoadSuccessCopyWith<$Res> {
  __$$_LoadSuccessCopyWithImpl(
      _$_LoadSuccess _value, $Res Function(_$_LoadSuccess) _then)
      : super(_value, (v) => _then(v as _$_LoadSuccess));

  @override
  _$_LoadSuccess get _value => super._value as _$_LoadSuccess;

  @override
  $Res call({
    Object? repoList = freezed,
  }) {
    return _then(_$_LoadSuccess(
      repoList: repoList == freezed
          ? _value.repoList
          : repoList // ignore: cast_nullable_to_non_nullable
              as Fresh<List<GithubRepo>>,
    ));
  }
}

/// @nodoc

class _$_LoadSuccess extends _LoadSuccess {
  const _$_LoadSuccess({required this.repoList}) : super._();

  @override
  final Fresh<List<GithubRepo>> repoList;

  @override
  String toString() {
    return 'StarredRepoState.loadSuccess(repoList: $repoList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadSuccess &&
            const DeepCollectionEquality().equals(other.repoList, repoList));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(repoList));

  @JsonKey(ignore: true)
  @override
  _$$_LoadSuccessCopyWith<_$_LoadSuccess> get copyWith =>
      __$$_LoadSuccessCopyWithImpl<_$_LoadSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Fresh<List<GithubRepo>> repoList) initial,
    required TResult Function(Fresh<List<GithubRepo>> repoList, int itemPerPage)
        loading,
    required TResult Function(Fresh<List<GithubRepo>> repoList) loadSuccess,
    required TResult Function(
            Fresh<List<GithubRepo>> repoList, GithubFailure failure)
        loadFailure,
  }) {
    return loadSuccess(repoList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Fresh<List<GithubRepo>> repoList)? initial,
    TResult Function(Fresh<List<GithubRepo>> repoList, int itemPerPage)?
        loading,
    TResult Function(Fresh<List<GithubRepo>> repoList)? loadSuccess,
    TResult Function(Fresh<List<GithubRepo>> repoList, GithubFailure failure)?
        loadFailure,
  }) {
    return loadSuccess?.call(repoList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<List<GithubRepo>> repoList)? initial,
    TResult Function(Fresh<List<GithubRepo>> repoList, int itemPerPage)?
        loading,
    TResult Function(Fresh<List<GithubRepo>> repoList)? loadSuccess,
    TResult Function(Fresh<List<GithubRepo>> repoList, GithubFailure failure)?
        loadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(repoList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return loadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
  }) {
    return loadSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(this);
    }
    return orElse();
  }
}

abstract class _LoadSuccess extends StarredRepoState {
  const factory _LoadSuccess(
      {required final Fresh<List<GithubRepo>> repoList}) = _$_LoadSuccess;
  const _LoadSuccess._() : super._();

  @override
  Fresh<List<GithubRepo>> get repoList;
  @override
  @JsonKey(ignore: true)
  _$$_LoadSuccessCopyWith<_$_LoadSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadFailureCopyWith<$Res>
    implements $StarredRepoStateCopyWith<$Res> {
  factory _$$_LoadFailureCopyWith(
          _$_LoadFailure value, $Res Function(_$_LoadFailure) then) =
      __$$_LoadFailureCopyWithImpl<$Res>;
  @override
  $Res call({Fresh<List<GithubRepo>> repoList, GithubFailure failure});

  @override
  $FreshCopyWith<List<GithubRepo>, $Res> get repoList;
  $GithubFailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$_LoadFailureCopyWithImpl<$Res>
    extends _$StarredRepoStateCopyWithImpl<$Res>
    implements _$$_LoadFailureCopyWith<$Res> {
  __$$_LoadFailureCopyWithImpl(
      _$_LoadFailure _value, $Res Function(_$_LoadFailure) _then)
      : super(_value, (v) => _then(v as _$_LoadFailure));

  @override
  _$_LoadFailure get _value => super._value as _$_LoadFailure;

  @override
  $Res call({
    Object? repoList = freezed,
    Object? failure = freezed,
  }) {
    return _then(_$_LoadFailure(
      repoList: repoList == freezed
          ? _value.repoList
          : repoList // ignore: cast_nullable_to_non_nullable
              as Fresh<List<GithubRepo>>,
      failure: failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as GithubFailure,
    ));
  }

  @override
  $GithubFailureCopyWith<$Res> get failure {
    return $GithubFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$_LoadFailure extends _LoadFailure {
  const _$_LoadFailure({required this.repoList, required this.failure})
      : super._();

  @override
  final Fresh<List<GithubRepo>> repoList;
  @override
  final GithubFailure failure;

  @override
  String toString() {
    return 'StarredRepoState.loadFailure(repoList: $repoList, failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadFailure &&
            const DeepCollectionEquality().equals(other.repoList, repoList) &&
            const DeepCollectionEquality().equals(other.failure, failure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(repoList),
      const DeepCollectionEquality().hash(failure));

  @JsonKey(ignore: true)
  @override
  _$$_LoadFailureCopyWith<_$_LoadFailure> get copyWith =>
      __$$_LoadFailureCopyWithImpl<_$_LoadFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Fresh<List<GithubRepo>> repoList) initial,
    required TResult Function(Fresh<List<GithubRepo>> repoList, int itemPerPage)
        loading,
    required TResult Function(Fresh<List<GithubRepo>> repoList) loadSuccess,
    required TResult Function(
            Fresh<List<GithubRepo>> repoList, GithubFailure failure)
        loadFailure,
  }) {
    return loadFailure(repoList, failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Fresh<List<GithubRepo>> repoList)? initial,
    TResult Function(Fresh<List<GithubRepo>> repoList, int itemPerPage)?
        loading,
    TResult Function(Fresh<List<GithubRepo>> repoList)? loadSuccess,
    TResult Function(Fresh<List<GithubRepo>> repoList, GithubFailure failure)?
        loadFailure,
  }) {
    return loadFailure?.call(repoList, failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<List<GithubRepo>> repoList)? initial,
    TResult Function(Fresh<List<GithubRepo>> repoList, int itemPerPage)?
        loading,
    TResult Function(Fresh<List<GithubRepo>> repoList)? loadSuccess,
    TResult Function(Fresh<List<GithubRepo>> repoList, GithubFailure failure)?
        loadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(repoList, failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return loadFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
  }) {
    return loadFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(this);
    }
    return orElse();
  }
}

abstract class _LoadFailure extends StarredRepoState {
  const factory _LoadFailure(
      {required final Fresh<List<GithubRepo>> repoList,
      required final GithubFailure failure}) = _$_LoadFailure;
  const _LoadFailure._() : super._();

  @override
  Fresh<List<GithubRepo>> get repoList;
  GithubFailure get failure;
  @override
  @JsonKey(ignore: true)
  _$$_LoadFailureCopyWith<_$_LoadFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
