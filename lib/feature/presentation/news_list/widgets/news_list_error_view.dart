import 'package:flutter/material.dart';

class NewsListErrorView extends StatelessWidget {
  const NewsListErrorView({super.key, required this.onPressed});

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
