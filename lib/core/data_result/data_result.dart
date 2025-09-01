import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:newsapp/core/exceptions/exceptions.dart';

part 'data_result.freezed.dart';

@freezed
class DataResult<T> with _$DataResult<T> {
  const DataResult._();

  const factory DataResult.success(T data) = Success<T>;
  const factory DataResult.failure(AppException failure) = Failure<T>;

  bool get isSuccess => maybeWhen(
    success: (_) => true,
    orElse: () => false,
  );

  bool get isFailure => !isSuccess;

  T? get data => maybeWhen(success: (d) => d, orElse: () => null);

  AppException? get error => maybeWhen(failure: (e) => e, orElse: () => null);
}


