import 'package:injectable/injectable.dart';
import 'package:newsapp/core/data_result/data_result.dart';
import 'package:newsapp/feature/domain/entities/news_entity.dart';
import 'package:newsapp/feature/domain/repository/news_repository.dart';

@injectable
class NewsDetailUseCase {
  final INewsRepository repository;

  NewsDetailUseCase(this.repository);

  Future<DataResult<ArticleEntity>> call(String articleTitle) async {
    return await repository.fetchArticle(articleTitle);
  }
}
