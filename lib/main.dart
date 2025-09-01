import 'package:flutter/material.dart';
import 'package:newsapp/core/env/environment_variables.dart';
import 'package:newsapp/core/services/isar/isar.dart';
import 'package:newsapp/di/dependency_provider.dart';
import 'package:newsapp/feature/presentation/news_list/news_list_page.dart';
import 'package:newsapp/theme/theme.dart';
import 'package:newsapp/widgets/adaptive_wrapper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await EnvironmentVariables.verify();

  ///initial the dependency injection
  await configureDependencies();

  ///initial the isar database
  await getIt<IsarService>().initialize();

  runApp(AdaptiveWrapper(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News Watch',
      debugShowCheckedModeBanner: false,
      theme: appDefaultTheme(),
      home: NewsListPage(),
    );
  }
}
