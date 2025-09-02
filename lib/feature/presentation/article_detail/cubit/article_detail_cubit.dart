import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:newsapp/core/exceptions/exceptions.dart';
import 'package:newsapp/feature/domain/entities/news_entity.dart';
import 'package:newsapp/feature/domain/usecase/article_detail_usecase.dart';

part 'article_detail_cubit.freezed.dart';
part 'article_detail_state.dart';

@injectable
class ArticleDetailCubit extends Cubit<ArticleDetailState> {
  ArticleDetailCubit(this._newsDetailUseCase, @factoryParam String articleTitle)
      : _articleTitle = articleTitle,
        super(const ArticleDetailState.loading());

  final ArticleDetailUseCase _newsDetailUseCase;
  final String _articleTitle;

  void fetchData() async {
    final result =  await _newsDetailUseCase.call(_articleTitle);

    if(result.isSuccess && result.data != null) {
      emit(ArticleDetailState.success(result.data!));
    } else {
      emit(ArticleDetailState.error(result.error!));
    }
  }
}
