import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:newsapp/core/exceptions/exceptions.dart';
import 'package:newsapp/feature/domain/entities/news_entity.dart';
import 'package:newsapp/feature/domain/usecase/news_detail_usecase.dart';

part 'news_detail_cubit.freezed.dart';
part 'news_detail_state.dart';

@injectable
class NewsDetailCubit extends Cubit<NewsDetailState> {
  NewsDetailCubit(this._newsDetailUseCase, @factoryParam String articleTitle)
      : _articleTitle = articleTitle,
        super(const NewsDetailState.loading());

  final NewsDetailUseCase _newsDetailUseCase;
  final String _articleTitle;

  void fetchData() async {
    final result =  await _newsDetailUseCase.call(_articleTitle);

    if(result.isSuccess && result.data != null) {
      emit(NewsDetailState.success(result.data!));
    } else {
      emit(NewsDetailState.error(result.error!));
    }
  }
}
