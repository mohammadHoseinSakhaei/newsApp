import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/core/utils/date_utils.dart';
import 'package:newsapp/feature/domain/entities/news_entity.dart';
import 'package:newsapp/feature/presentation/article_detail/article_detail_page.dart';
import 'package:newsapp/theme/colors.dart';
import 'package:newsapp/theme/text_styles.dart';
import 'package:newsapp/widgets/image_loading_service.dart';

class ArticleListItem extends StatelessWidget {
  const ArticleListItem({super.key, required this.articleEntity});

  final ArticleEntity articleEntity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ArticleDetailPage(articleTitle: articleEntity.title),));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h, left: 12.w, right: 12.w, top: 24.h),
        width: double.infinity,
        padding: EdgeInsets.only(bottom: 22.h),
        decoration: BoxDecoration(color: ThemeColors.gray1, borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ImageLoadingService(
                  imageUrl: articleEntity.urlToImage,
                  width: double.infinity,
                  height: 156.h,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(16), topLeft: Radius.circular(16)),
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 12.h,
                  left: 12.h,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.black.withValues(alpha: 0.6),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        articleEntity.query,
                        style: AdaptiveTextStyles.caption1.copyWith(color: ThemeColors.scGreen),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
              child: Text(articleEntity.title, style: AdaptiveTextStyles.title3b),
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.w, right: 12.w, top: 16.h, bottom: 22.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: articleEntity.author != null
                        ? Text(
                            articleEntity.author!,
                            style: AdaptiveTextStyles.body.copyWith(fontWeight: FontWeight.w400, fontSize: 15),
                          )
                        : SizedBox(),
                  ),
                  Text(AppDateUtils.formatToDate(articleEntity.publishedAt)),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Text(
                articleEntity.description,
                style: AdaptiveTextStyles.caption1,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
