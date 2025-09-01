import 'package:newsapp/feature/data/model/remote/news_model.dart';
import 'package:newsapp/feature/domain/entities/news_entity.dart';

extension ArticleDtoMapper on Article {
  ArticleEntity toEntity() => ArticleEntity(
    source: SourceEntity(id: source.id as String?, name: source.name),
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