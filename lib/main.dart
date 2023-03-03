import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'testdrive_theme.dart';
import './screens/home_page.dart';
import 'provider/categories_provider.dart';
import 'screens/brand_quiz.dart';
import 'provider/brands_provider.dart';
import 'screens/end_brand_quiz.dart';

void main() {
  runApp(const TestDrive());
}

class TestDrive extends StatelessWidget {
  const TestDrive({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = FooderlichTheme.dark();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CategoryProvider>(
          create: (_) => CategoryProvider(),
        ),
        ChangeNotifierProvider<BrandProvider>(
          create: (_) => BrandProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        //theme: theme,
        routes: {
          '/': (context) => const HomePage(),
          BrandQuizScreen.routeName: (context) => const BrandQuizScreen(),
          EndBrandQuiz.routeName: (context) => const EndBrandQuiz(),
        },
        theme: theme,
      ),
    );
  }
}
