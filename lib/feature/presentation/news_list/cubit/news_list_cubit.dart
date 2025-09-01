import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';
import 'package:newsapp/core/utils/date_utils.dart';
import 'package:newsapp/feature/domain/entities/news_entity.dart';
import 'package:newsapp/feature/domain/usecase/news_usecase.dart';

part 'news_list_cubit.freezed.dart';
part 'news_list_state.dart';

@injectable
class NewsListCubit extends Cubit<NewsListState> {
  NewsListCubit(this._newsListUseCase) : super(const NewsListState.initial()) {
    loadAllNews(1);
    _pagingController.addPageRequestListener((pageKey) {
      loadAllNews(pageKey);
    });
  }

  final NewsListUseCase _newsListUseCase;
  final PagingController<int, ArticleEntity> _pagingController = PagingController(firstPageKey: 1);

  PagingController<int, ArticleEntity> get pagingController => _pagingController;

  void loadAllNews(int page) async {
    final news = await _newsListUseCase.call(
      page: page,
      from: AppDateUtils.getDateRange()['from'] ?? '',
      to: AppDateUtils.getDateRange()['to'] ?? '',
    );

    news.when(
      success: (data) {
        final isLastPage = data.length < 20;
        if (isLastPage) {
          _pagingController.appendLastPage(data);
        } else {
          final nextPageKey = page + 1;
          _pagingController.appendPage(data, nextPageKey);
        }
      },
      failure: (error) {
        _pagingController.error = error.message;
      },
    );
  }

  @override
  Future<void> close() {
    _pagingController.dispose();
    return super.close();
  }
}
