import 'package:newsapp/core/data_result/data_result.dart';
import 'package:newsapp/feature/domain/entities/news_entity.dart';

abstract class IArticleRepository {
  Future<DataResult<List<ArticleEntity>>> fetchAllArticle({
    required int page,
    required String from,
    required String to,
  });

  Future<DataResult<ArticleEntity>> fetchArticle(String articleTitle);
}
