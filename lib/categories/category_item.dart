import 'package:flutter/material.dart';
import 'package:news_application/constants/app_theme.dart';
import 'package:news_application/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem(this.category);

  CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Image.asset(
            'assets/images/${category.imageName}.png',
            height: MediaQuery.sizeOf(context).height * 0.25,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 10, bottom: 120),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                category.name,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: AppTheme.black,
                  fontSize: 36,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
