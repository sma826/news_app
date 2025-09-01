import 'package:flutter/material.dart';
import 'package:news_application/categories/data/models/category_model.dart';
import 'package:news_application/categories/view/widgets/category_item.dart';

class CategoriesView extends StatelessWidget {
  void Function(CategoryModel) onCategorySelected;

  CategoriesView({required this.onCategorySelected});

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
              itemBuilder: (_, index) => GestureDetector(
                onTap: () {
                  onCategorySelected(CategoryModel.categories[index]);
                },
                child: CategoryItem(CategoryModel.categories[index]),
              ),
              separatorBuilder: (_, index) => SizedBox(height: 16),
              itemCount: CategoryModel.categories.length,
            ),
          ),
        ],
      ),
    );
  }
}
