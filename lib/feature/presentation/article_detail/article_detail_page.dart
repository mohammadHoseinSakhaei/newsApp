import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/di/dependency_provider.dart';
import 'package:newsapp/feature/presentation/article_detail/cubit/article_detail_cubit.dart';
import 'package:newsapp/theme/text_styles.dart';
import 'package:newsapp/widgets/image_loading_service.dart';

class ArticleDetailPage extends StatelessWidget {
  const ArticleDetailPage({super.key, required this.articleTitle});

  final String articleTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt.get<ArticleDetailCubit>(param1: articleTitle)..fetchData(),
        child: BlocBuilder<ArticleDetailCubit, ArticleDetailState>(
          builder: (context, state) {
            return state.when(
              loading: () => SafeArea(child: Center(child: CircularProgressIndicator())),
              success: (article) => SafeArea(
                top: true,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(icon: Icon(Icons.arrow_back_ios_new_outlined),onPressed: ()=> Navigator.pop(context)),
                    ImageLoadingService(imageUrl: article.urlToImage,width: double.infinity,fit: BoxFit.cover,),
                    SingleChildScrollView(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(16), topLeft: Radius.circular(16)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(article.title, style: AdaptiveTextStyles.body.copyWith(fontWeight: FontWeight.w700)),
                              SizedBox(height: 24.h),
                              Text(article.description, style: AdaptiveTextStyles.title3b.copyWith(fontWeight: FontWeight.normal,fontSize: 19)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              error: (exception) => Text(exception.message),
            );
          },
        ),
      ),
    );
  }
}
