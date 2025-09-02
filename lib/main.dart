import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/home_screen.dart';
import 'package:news_application/shared/app_bloc_observer.dart';
import 'package:news_application/shared/constants/app_theme.dart';

void main() {
  var app = NewsApp;
  Bloc.observer = AppBlocObserver();
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
