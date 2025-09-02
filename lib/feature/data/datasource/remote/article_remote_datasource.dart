import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:newsapp/core/data_result/data_result.dart';
import 'package:newsapp/core/env/environment_variables.dart';
import 'package:newsapp/core/exceptions/exceptions.dart';
import 'package:newsapp/feature/data/model/remote/news_model.dart';

abstract class IArticleRemoteDataSource {
  Future<DataResult<NewsModel>> fetchArticles({
    required String query,
    required int page,
    required String from,
    required String to,
  });
}

@Injectable(as: IArticleRemoteDataSource)
class ArticleRemoteDatasource implements IArticleRemoteDataSource {
  ArticleRemoteDatasource({required Dio httpClient}) : _httpClient = httpClient;

  final Dio _httpClient;

  @override
  Future<DataResult<NewsModel>> fetchArticles({
    required String query,
    required int page,
    required String from,
    required String to,
  }) async {
    try {
      final response = await _httpClient.get(
        '/everything',
        queryParameters: {
          'q': query,
          'from': from,
          'to': to,
          'page': page,
          'pageSize': 10,
          'sortBy': "publishedAt",
          'apiKey': EnvironmentVariables.apiKey,
        },
      );

      if (response.statusCode == 200) {
        final newsModel = NewsModel.fromJson(response.data,query);
        return DataResult.success(newsModel);
      } else {
        return DataResult.failure(Exception('Failed to load news: ${response.statusCode}') as AppException);
      }
    } catch (e) {
      if (e is DioException) {
        return DataResult.failure(NetworkFailure('internet disconnected'));
      }
      return DataResult.failure(Exception('Failed to load news: $e') as AppException);
    }
  }
}
