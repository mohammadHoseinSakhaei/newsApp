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
    final Map<String, List<ArticleEntity>> groupedArticles = {};

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

          ///sorted by last date
          articles.sort((a, b) => b.publishedAt.compareTo(a.publishedAt));

          groupedArticles[q] = articles;
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


      List<ArticleEntity> arranged = _interleaveArticlesFromGroups(groupedArticles, queries);

      final seenUrls = <String>{};
      arranged = arranged.where((a) {
        final url = a.title;
        if (seenUrls.contains(url)) {
          return false;
        } else {
          seenUrls.add(url);
          return true;
        }
      }).toList();

      ///cached data
      await _localDataSource.cacheArticles(arranged);

      return DataResult.success(arranged);
    } catch (e) {
      final localResult = await _localDataSource.getCachedArticles();
      return localResult;
    }

  }

  List<ArticleEntity> _interleaveArticlesFromGroups(
      Map<String, List<ArticleEntity>> groupedArticles,
      List<String> queries,
      ) {
    final List<ArticleEntity> result = [];
    int index = 0;

    while (true) {
      bool added = false;

      for (final q in queries) {
        final group = groupedArticles[q];
        if (group != null && index < group.length) {
          result.add(group[index]);
          added = true;
        }
      }

      if (!added) break;
      index++;
    }

    return result;
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
