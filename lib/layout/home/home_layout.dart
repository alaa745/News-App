import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:newsapp/model/category_model.dart';
import 'package:newsapp/screens/articles/articles_screen.dart';
import 'package:newsapp/screens/categories/categories_screen.dart';
import 'package:newsapp/screens/home_news_fragment/home_news_fragment.dart';
import 'package:newsapp/shared/style/components/category_item.dart';

class HomeLayout extends StatelessWidget {
  static String routeName = "Home";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/background.jpg"),
        ),
      ),
      child: Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          title: const Text(
            "News App",
          ),
        ),
        body: CategoriesSCreen(),
      ),
    );
  }
}
