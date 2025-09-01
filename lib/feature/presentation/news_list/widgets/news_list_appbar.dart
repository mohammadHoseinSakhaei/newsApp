import 'package:flutter/material.dart';
import 'package:newsapp/theme/colors.dart';
import 'package:newsapp/theme/text_styles.dart';

class NewsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NewsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      scrolledUnderElevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'News',
                  style: AdaptiveTextStyles.body.copyWith(color: ThemeColors.scBlue),
                ),
                TextSpan(
                  text: 'Watch',
                  style: AdaptiveTextStyles.body.copyWith(color: ThemeColors.pcDark),
                ),
              ],
            ),
          ),
          const Icon(Icons.newspaper),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
