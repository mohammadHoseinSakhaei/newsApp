import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:newsapp/core/env/environment_variables.dart';

@module
abstract class DioModule {
  @lazySingleton
  Dio provideDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: EnvironmentVariables.baseUrl,
        contentType: 'application/json',
        responseType: ResponseType.json,
      ),
    );
    return dio;
  }
}
