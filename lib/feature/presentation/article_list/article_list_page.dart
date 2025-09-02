import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:newsapp/di/dependency_provider.dart';
import 'package:newsapp/feature/domain/entities/news_entity.dart';
import 'package:newsapp/feature/presentation/article_list/cubit/article_list_cubit.dart';
import 'package:newsapp/feature/presentation/article_list/widgets/article_list_appbar.dart';
import 'package:newsapp/feature/presentation/article_list/widgets/article_list_error_view.dart';
import 'package:newsapp/feature/presentation/article_list/widgets/article_list_item.dart';
import 'package:newsapp/feature/presentation/article_list/widgets/article_list_loading_view.dart';

class ArticleListPage extends StatelessWidget {
  const ArticleListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ArticleListAppbar(),
      body: BlocProvider(
        create: (context) => getIt.get<ArticleListCubit>(),
        child: SafeArea(
          child: BlocBuilder<ArticleListCubit, ArticleListState>(
            builder: (context, state) {
              return PagedListView<int, ArticleEntity>(
                pagingController: context.read<ArticleListCubit>().pagingController,
                builderDelegate: PagedChildBuilderDelegate(
                  firstPageProgressIndicatorBuilder: (context) => ArticleListLoadingView(),
                  itemBuilder: (context, item, index) => ArticleListItem(articleEntity: item),
                  firstPageErrorIndicatorBuilder: (context) => ArticleListErrorView(onPressed: () {
                    context.read<ArticleListCubit>().pagingController.refresh();
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
