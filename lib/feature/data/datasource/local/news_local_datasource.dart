import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:newsapp/core/data_result/data_result.dart';
import 'package:newsapp/core/exceptions/exceptions.dart';
import 'package:newsapp/core/services/isar/isar.dart';
import 'package:newsapp/feature/data/model/local/news_local_model.dart';
import 'package:newsapp/feature/domain/entities/news_entity.dart';

abstract class INewsLocalDataSource {
  Future<DataResult<void>> cacheArticles(List<ArticleEntity> articles);

  Future<DataResult<List<ArticleEntity>>> getCachedArticles();

  Future<DataResult<ArticleEntity>> fetchArticle(String articleTitle);
}

@Injectable(as: INewsLocalDataSource)
class NewsLocalDataSourceImpl implements INewsLocalDataSource {
  NewsLocalDataSourceImpl({required IsarService isarService}) : _isarService = isarService;

  final IsarService _isarService;

  Isar get _isar => _isarService.instance;

  @override
  Future<DataResult<void>> cacheArticles(List<ArticleEntity> articles) async {
    try {
      final locals = articles.map(ArticleLocal.fromEntity).toList();

      await _isar.writeTxn(() async {
        await _isar.articleLocals.putAll(locals);
      });

      return const DataResult.success(null);
    } catch (e) {
      return DataResult.failure(CacheFailure('Failed to cache articles'));
    }
  }

  @override
  Future<DataResult<List<ArticleEntity>>> getCachedArticles() async {
    try {
      final rows = await _isar.articleLocals.where().distinctByTitle().findAll();

      final entities = rows.map((e) => e.toEntity()).toList();
      return DataResult.success(entities);
    } catch (e) {
      return DataResult.failure(CacheFailure('Failed to get cached articles'));
    }
  }

  @override
  Future<DataResult<ArticleEntity>> fetchArticle(String articleTitle) async {
    try {
      final article = await _isar.articleLocals
          .filter()
          .titleEqualTo(articleTitle)
          .findFirst();

      if (article != null) {
        return DataResult.success(article.toEntity());
      } else {
        return DataResult.failure(CacheFailure('Article with id $articleTitle not found'));
      }
    } catch (e) {
      return DataResult.failure(CacheFailure('Failed to fetch article: $e'));
    }
  }
}
