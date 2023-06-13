import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:newsapp/model/category_model.dart';
import 'package:newsapp/screens/articles/articles_arguments.dart';
import 'package:newsapp/screens/articles/articles_screen.dart';

import '../../shared/style/components/category_item.dart';

class CategoriesSCreen extends StatelessWidget {
  CategoriesSCreen();

  List<CategoryModel> categories = [
    CategoryModel(
      title: "Sports",
      imagePath: "images/ball.png",
      color: Color(0xFFC91C22),
    ),
    CategoryModel(
      title: "Politics",
      imagePath: "images/Politics.png",
      color: Color(0xFF003E90),
    ),
    CategoryModel(
      title: "Health",
      imagePath: "images/health.png",
      color: Color(0xFFED1E79),
    ),
    CategoryModel(
      title: "Business",
      imagePath: "images/bussines.png",
      color: Color(0xFFCF7E48),
    ),
    CategoryModel(
      title: "Environment",
      imagePath: "images/environment.png",
      color: Color(0xFF4882CF),
    ),
    CategoryModel(
      title: "Science",
      imagePath: "images/science.png",
      color: Color(0xFFF2D352),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 20.0),
          child: Text(
            "Pick your category \nof interest",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.1,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      ArticlesScreen.routeName,
                      arguments: ArticlesArguments(categories[index].title),
                    );
                  },
                  child: CategoryItem(
                      categoryModel: categories[index], index: index),
                );
              },
              itemCount: categories.length,
            ),
          ),
        ),
      ],
    );
  }
}
