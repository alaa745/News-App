import 'package:flutter/material.dart';
import 'package:newsapp/layout/home/home_layout.dart';
import 'package:newsapp/screens/articles/articles_screen.dart';
import 'package:newsapp/screens/home_news_fragment/home_news_fragment.dart';
import 'package:newsapp/shared/style/theme/myTheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: MyTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: HomeLayout.routeName,
      routes: {
        HomeLayout.routeName: (context) => HomeLayout(),
        HomeNewsFragment.routeName: (context) => HomeNewsFragment()
        // ArticlesScreen.routeName: (context) => ArticlesScreen(),
      },
    );
  }
}
