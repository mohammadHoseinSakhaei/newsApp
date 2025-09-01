import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../logger/logger.dart';

final dotEnv = DotEnv();

class EnvironmentVariables {
  static const String _baseUrl = "API_BASE_URL";
  static const String _apiKey = "API_KEY";

  static verify() async {
    await dotEnv.load(fileName: '.env');
    final verified = dotEnv.isEveryDefined([
      _baseUrl,
      _apiKey
    ]);
    if (!verified) {
      logger.e('.env cannot be verified');
    } else {
      logger.i('.env loaded successfully');
    }
  }

  getAppName() {}

  static String get baseUrl => dotEnv.env[_baseUrl]!;

  static String get apiKey => dotEnv.env[_apiKey]!;


}
