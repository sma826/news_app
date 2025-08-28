import 'package:flutter/material.dart';
import 'package:news_application/constants/app_theme.dart';

class TextFieldCustomized extends StatefulWidget {
  TextFieldCustomized({super.key});

  @override
  State<TextFieldCustomized> createState() => _TextFieldCustomizedState();
}

class _TextFieldCustomizedState extends State<TextFieldCustomized> {
  TextEditingController searchController = TextEditingController();
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      autofocus: true,
      decoration: InputDecoration(
        // prefixIcon: Icon(Icons.search_rounded,color: AppTheme.white,size: 30,),
        // suffixIcon: Icon(Icons.close_rounded,color: AppTheme.white,size: 30,),
        hintText: 'Search',
        hintStyle: TextStyle(
          fontFamily: 'inter',
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: AppTheme.white,
        ),
      ),
      onChanged: (value) {
        setState(() {
          isSearching = value.isNotEmpty;
        });
      },
    );
  }
}
