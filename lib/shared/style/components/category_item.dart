import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:newsapp/model/category_model.dart';

class CategoryItem extends StatelessWidget {
  CategoryModel categoryModel;
  int index;

  CategoryItem({required this.categoryModel, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: categoryModel.color,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(30),
          topRight: const Radius.circular(30),
          bottomLeft: index % 2 == 0 ? const Radius.circular(30) : Radius.zero,
          bottomRight: index % 2 == 0 ? Radius.zero : const Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          Image.asset(
            categoryModel.imagePath,
            height: 140,
            width: 140,
          ),
          Text(
            categoryModel.title,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
