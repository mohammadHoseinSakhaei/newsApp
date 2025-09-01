import 'package:injectable/injectable.dart';
import 'package:newsapp/core/data_result/data_result.dart';
import 'package:newsapp/core/exceptions/exceptions.dart';
import 'package:newsapp/feature/data/datasource/local/news_local_datasource.dart';
import 'package:newsapp/feature/data/datasource/remote/news_remote_datasource.dart';
import 'package:newsapp/feature/data/mapper/article_model_mapper.dart';
import 'package:newsapp/feature/domain/entities/news_entity.dart';
import 'package:newsapp/feature/domain/repository/news_repository.dart';

@Injectable(as: INewsRepository)
class NewsRepositoryImpl implements INewsRepository {
  final INewsRemoteDataSource _remoteDataSource;
  final INewsLocalDataSource _localDataSource;

  NewsRepositoryImpl({required INewsRemoteDataSource remoteDataSource, required INewsLocalDataSource localDataSource})
    : _remoteDataSource = remoteDataSource,
      _localDataSource = localDataSource;

  @override
  Future<DataResult<List<ArticleEntity>>> fetchNews({
    required int page,
    required String from,
    required String to,
  }) async {
    final queries = ['microsoft', 'apple', 'google', 'tesla'];
    List<ArticleEntity> allArticles = [];

    try {
      for (final q in queries) {
        final remoteResponse = await _remoteDataSource.fetchNewsList(
          query: q,
          page: page,
          from: from,
          to: to,
        );

        if (remoteResponse.isSuccess) {
          final newsModel = remoteResponse.data!;
          final articles = newsModel.articles.map((a) => a.toEntity()).toList();
          allArticles.addAll(articles);
        } else {
          final error = remoteResponse.error!;
          if (error is NetworkFailure) {
            final localResult = await _localDataSource.getCachedArticles();
            return localResult;
          } else {
            return DataResult.failure(error);
          }
        }
      }

      ///arrange articles sequentially from different queries
      final arranged = _arrangeSequentially(allArticles);

      ///cache the arranged articles
      await _localDataSource.cacheArticles(arranged);

      return DataResult.success(arranged);
    } catch (e) {
      final localResult = await _localDataSource.getCachedArticles();
      return localResult;
    }
  }


  ///sort articles in a way that articles from different queries are interleaved
  List<ArticleEntity> _arrangeSequentially(List<ArticleEntity> articles) {
    final order = ['microsoft', 'apple', 'google', 'tesla'];
    List<ArticleEntity> arranged = [];
    final temp = List<ArticleEntity>.from(articles);

    int i = 0;
    while (temp.isNotEmpty) {
      final q = order[i % order.length];
      final index = temp.indexWhere((a) => a.query.toLowerCase() == q);
      if (index != -1) {
        arranged.add(temp.removeAt(index));
      }
      i++;
    }
    return arranged;
  }

  @override
  Future<DataResult<ArticleEntity>> fetchArticle(String articleTitle) async{
    final article = await _localDataSource.fetchArticle(articleTitle);

    return article.when(success: (data) {
      return DataResult.success(data);
    }, failure: (failure) {
      return DataResult.failure(failure);
    },);
  }

}
