import 'package:injectable/injectable.dart';
import 'package:newsapp/core/data_result/data_result.dart';
import 'package:newsapp/core/exceptions/exceptions.dart';
import 'package:newsapp/feature/data/datasource/local/article_local_datasource.dart';
import 'package:newsapp/feature/data/datasource/remote/article_remote_datasource.dart';
import 'package:newsapp/feature/data/mapper/article_model_mapper.dart';
import 'package:newsapp/feature/domain/entities/news_entity.dart';
import 'package:newsapp/feature/domain/repository/article_repository.dart';

@Injectable(as: IArticleRepository)
class ArticleRepositoryImpl implements IArticleRepository {
  final IArticleRemoteDataSource _remoteDataSource;
  final IArticleLocalDataSource _localDataSource;

  ArticleRepositoryImpl({
    required IArticleRemoteDataSource remoteDataSource,
    required IArticleLocalDataSource localDataSource,
  }) : _remoteDataSource = remoteDataSource,
       _localDataSource = localDataSource;

  @override
  Future<DataResult<List<ArticleEntity>>> fetchAllArticle({
    required int page,
    required String from,
    required String to,
  }) async {
    final queries = ['microsoft', 'apple', 'google', 'tesla'];
    List<ArticleEntity> allArticles = [];

    try {
      for (final q in queries) {
        final remoteResponse = await _remoteDataSource.fetchArticles(
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
      final arranged = _interleaveArticles(allArticles, queries);

      ///cache the arranged articles
      await _localDataSource.cacheArticles(arranged);

      return DataResult.success(arranged);
    } catch (e) {
      final localResult = await _localDataSource.getCachedArticles();
      return localResult;
    }
  }

  List<ArticleEntity> _interleaveArticles(List<ArticleEntity> articles, List<String> order) {
    final grouped = {for (var q in order) q: articles.where((a) => a.query.toLowerCase() == q.toLowerCase()).toList()};

    final arranged = <ArticleEntity>[];
    bool hasItems;

    do {
      hasItems = false;
      for (var q in order) {
        final list = grouped[q]!;
        if (list.isNotEmpty) {
          arranged.add(list.removeAt(0));
          hasItems = true;
        }
      }
    } while (hasItems);

    return arranged;
  }

  @override
  Future<DataResult<ArticleEntity>> fetchArticle(String articleTitle) async {
    final article = await _localDataSource.fetchArticle(articleTitle);

    return article.when(
      success: (data) {
        return DataResult.success(data);
      },
      failure: (failure) {
        return DataResult.failure(failure);
      },
    );
  }
}
