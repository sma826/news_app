import 'package:flutter/material.dart';
import 'package:news_application/categories/category_item.dart';
import 'package:news_application/models/category_model.dart';

class CategoriesView extends StatelessWidget {
  // const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          Text(
            'Good Morning\nHere is Some News For You',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (_, index) =>
                  CategoryItem(CategoryModel.categories[index]),
              separatorBuilder: (_, index) => SizedBox(height: 16),
              itemCount: CategoryModel.categories.length,
            ),
          ),
        ],
      ),
    );
  }
}
