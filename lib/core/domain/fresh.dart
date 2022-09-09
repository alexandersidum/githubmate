import 'package:freezed_annotation/freezed_annotation.dart';

part 'fresh.freezed.dart';

@freezed
class Fresh<T> with _$Fresh<T> {
  const factory Fresh({
    required T data,
    required bool isFresh,
    bool? isNextPageAvailable,
  }) = _Fresh;
  const Fresh._();

  factory Fresh.yes({
    required T data,
    bool? isNextPageAvailable,
  }) =>
      Fresh(
          data: data, isFresh: true, isNextPageAvailable: isNextPageAvailable);

  factory Fresh.no({
    required T data,
    bool? isNextPageAvailable,
  }) =>
      Fresh(
          data: data, isFresh: false, isNextPageAvailable: isNextPageAvailable);
}
