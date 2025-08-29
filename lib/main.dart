import 'package:flutter/material.dart';
import 'package:news_application/home_screen.dart';
import 'package:news_application/shared/constants/app_theme.dart';

void main() {
  var app = NewsApp;
  runApp(NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {HomeScreen.routname: (_) => HomeScreen()},
      initialRoute: HomeScreen.routname,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
