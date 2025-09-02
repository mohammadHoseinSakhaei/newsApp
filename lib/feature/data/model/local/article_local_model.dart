import 'package:isar/isar.dart';
import 'package:newsapp/feature/domain/entities/news_entity.dart';

part 'article_local_model.g.dart';

@Collection()
class ArticleLocal {
  Id isarId = Isar.autoIncrement;
  final String sourceName;
  final String? author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final DateTime publishedAt;
  final String content;
  final String query;

  ArticleLocal({
    required this.sourceName,
    this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
    required this.query,
  });

   ArticleEntity toEntity() {
    return ArticleEntity(
      source: SourceEntity(id: null, name: sourceName),
      author: author,
      title: title,
      description: description,
      url: url,
      urlToImage: urlToImage,
      publishedAt: publishedAt,
      content: content,
      query: query,
    );
  }

  factory ArticleLocal.fromEntity(ArticleEntity entity) {
    return ArticleLocal(
      sourceName: entity.source.name,
      author: entity.author,
      title: entity.title,
      description: entity.description,
      url: entity.url,
      urlToImage: entity.urlToImage,
      publishedAt: entity.publishedAt,
      content: entity.content,
      query: entity.query,
    );
  }
}
