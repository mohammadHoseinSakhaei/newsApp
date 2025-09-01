import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_model.freezed.dart';

@freezed
class NewsModel with _$NewsModel {
  const factory NewsModel({required String status, required int totalResults, required List<Article> articles}) =
      _NewsModel;

  factory NewsModel.fromJson(Map<String, dynamic> json, String query) {
    return NewsModel(
      status: json['status'] ?? '',
      totalResults: json['totalResults'] ?? 0,
      articles:
          (json['articles'] as List<dynamic>?)
              ?.map((articleJson) => Article.fromJson(articleJson as Map<String, dynamic>, query))
              .toList() ??
          [],
    );
  }
}

@freezed
class Article with _$Article {
  const factory Article({
    required Source source,
    required String? author,
    required String title,
    required String description,
    required String url,
    required String urlToImage,
    required DateTime publishedAt,
    required String content,
    required String query,
  }) = _Article;

  factory Article.fromJson(Map<String, dynamic> json, String query) {
    return Article(
      source: Source.fromJson(json['source']),
      author: json['author'] as String?,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      url: json['url'] ?? '',
      urlToImage: json['urlToImage'] ?? '',
      publishedAt: DateTime.parse(json['publishedAt'] ?? DateTime.now().toIso8601String()),
      content: json['content'] ?? '',
      query: query,
    );
  }
}

@freezed
class Source with _$Source {
  const factory Source({required dynamic id, required String name}) = _Source;

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(id: json['id'], name: json['name']);
  }
}
