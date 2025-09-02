part of 'article_detail_cubit.dart';

@freezed
class ArticleDetailState with _$ArticleDetailState {
  const factory ArticleDetailState.loading() = _Initial;
  const factory ArticleDetailState.success(ArticleEntity article) = _Success;
  const factory ArticleDetailState.error(AppException exception) = _Error;
}
