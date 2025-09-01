import 'package:newsapp/feature/data/mapper/article_model_mapper.dart';
import 'package:newsapp/feature/data/model/remote/news_model.dart';
import 'package:newsapp/feature/domain/entities/news_entity.dart';

extension NewsDtoMapper on NewsModel {
  NewsEntity toEntity() => NewsEntity(
    articles: articles.map((a) => a.toEntity()).toList(),
  );
}