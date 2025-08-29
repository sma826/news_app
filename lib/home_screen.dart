import 'package:flutter/material.dart';
import 'package:news_application/categories/view/widgets/categories_view.dart';
import 'package:news_application/drawer/home_drawer.dart';
import 'package:news_application/models/category_model.dart';
import 'package:news_application/news/view/widgets/news_view.dart';
import 'package:news_application/search/search_screen.dart';
import 'package:news_application/shared/constants/app_theme.dart';

class HomeScreen extends StatefulWidget {
  static const String routname = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoryModel? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedCategory == null ? 'Home' : selectedCategory!.name),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      SearchScreen(categoryId: selectedCategory?.id),
                ),
              );
            },
            child: Icon(Icons.search_rounded, color: AppTheme.white, size: 30),
          ),
        ],
      ),
      drawer: HomeDrawer(onGoToHomeClicked: resetSelectedCategory),
      body: selectedCategory == null
          ? CategoriesView(onCategorySelected: onCategorySelected)
          : NewsView(categoryId: selectedCategory!.id),
    );
  }

  void onCategorySelected(CategoryModel category) {
    selectedCategory = category;
    setState(() {});
  }

  void resetSelectedCategory() {
    if (selectedCategory == null) return;
    selectedCategory = null;
    setState(() {});
  }
}
