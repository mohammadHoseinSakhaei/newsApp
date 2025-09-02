import 'package:injectable/injectable.dart';
import 'package:newsapp/core/data_result/data_result.dart';
import 'package:newsapp/feature/domain/entities/news_entity.dart';
import 'package:newsapp/feature/domain/repository/article_repository.dart';
@injectable
class ArticleListUseCase {
  final IArticleRepository repository;

  ArticleListUseCase(this.repository);

  Future<DataResult<List<ArticleEntity>>> call({
    required int page,
    required String from,
    required String to,
  }) async {
    return await repository.fetchAllArticle(page: page,from: from, to: to);
  }
}
