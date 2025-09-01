import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:newsapp/di/dependency_provider.dart';
import 'package:newsapp/feature/domain/entities/news_entity.dart';
import 'package:newsapp/feature/presentation/news_list/cubit/news_list_cubit.dart';
import 'package:newsapp/feature/presentation/news_list/widgets/news_list_appbar.dart';
import 'package:newsapp/feature/presentation/news_list/widgets/news_list_error_view.dart';
import 'package:newsapp/feature/presentation/news_list/widgets/news_list_item.dart';
import 'package:newsapp/feature/presentation/news_list/widgets/news_list_loading_view.dart';

class NewsListPage extends StatelessWidget {
  const NewsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewsAppBar(),
      body: BlocProvider(
        create: (context) => getIt.get<NewsListCubit>(),
        child: SafeArea(
          child: BlocBuilder<NewsListCubit, NewsListState>(
            builder: (context, state) {
              return PagedListView<int, ArticleEntity>(
                pagingController: context.read<NewsListCubit>().pagingController,
                builderDelegate: PagedChildBuilderDelegate(
                  firstPageProgressIndicatorBuilder: (context) => NewsListLoadingView(),
                  itemBuilder: (context, item, index) => NewsListItem(articleEntity: item),
                  firstPageErrorIndicatorBuilder: (context) => NewsListErrorView(onPressed: () {
                    context.read<NewsListCubit>().pagingController.refresh();
                  },),
                  newPageProgressIndicatorBuilder: (context) => CircularProgressIndicator(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
