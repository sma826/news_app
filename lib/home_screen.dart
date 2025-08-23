import 'package:flutter/material.dart';
import 'package:news_application/categories/categories_view.dart';
import 'package:news_application/constants/app_theme.dart';

class HomeScreen extends StatelessWidget {
  static const String routname = '/home';

  // const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu, color: AppTheme.white, size: 30,),
        title: Text('Home'),
        actions: [
          Icon(Icons.search_rounded, color: AppTheme.white, size: 30,)
        ],
      ),
      body: CategoriesView(),
    );
  }
}
