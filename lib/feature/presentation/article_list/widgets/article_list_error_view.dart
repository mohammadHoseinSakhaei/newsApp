import 'package:flutter/material.dart';

class ArticleListErrorView extends StatelessWidget {
  const ArticleListErrorView({super.key, required this.onPressed});

  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Something went wrong, please try again later.'),
        ElevatedButton(onPressed: onPressed, child: Text('TryAgain'))
      ],
    );
  }
}
