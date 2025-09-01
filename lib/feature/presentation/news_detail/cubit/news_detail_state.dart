part of 'news_detail_cubit.dart';

@freezed
class NewsDetailState with _$NewsDetailState {
  const factory NewsDetailState.loading() = _Initial;
  const factory NewsDetailState.success(ArticleEntity article) = _Success;
  const factory NewsDetailState.error(AppException exception) = _Error;
}
