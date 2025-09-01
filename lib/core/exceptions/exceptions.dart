/// Base failure type used across the app.
///
/// Represents a recoverable error that can be returned from repositories/usecases
/// instead of throwing. It also implements [Exception] to allow throwing when needed.
abstract class AppException implements Exception {
  const AppException(this.message, {this.code});

  /// Human-readable message (safe to show to user if needed)
  final String message;

  /// Optional machine error code (HTTP status, custom error id, etc)
  final int? code;

  @override
  String toString() => '${runtimeType.toString()}: ' + message + (code == null ? '' : ' (code: ' + code.toString() + ')');
}

class NetworkFailure extends AppException {
  const NetworkFailure(String message, {int? code}) : super(message, code: code);
}

class ServerFailure extends AppException {
  const ServerFailure(String message, {int? code}) : super(message, code: code);
}

class CacheFailure extends AppException {
  const CacheFailure(String message, {int? code}) : super(message, code: code);
}

class UnauthorizedFailure extends AppException {
  const UnauthorizedFailure(String message, {int? code}) : super(message, code: code);
}

class UnknownFailure extends AppException {
  const UnknownFailure(String message, {int? code}) : super(message, code: code);
}


