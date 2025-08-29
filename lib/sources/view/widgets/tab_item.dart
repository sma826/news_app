import 'package:flutter/material.dart';
import 'package:news_application/sources/data/models/sources_response.dart';

class TabItem extends StatelessWidget {
  Sources source;
  bool isSelected;

  TabItem({super.key, required this.source, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Text(
      source.name ?? '',
      style: isSelected ? textTheme.titleMedium : textTheme.titleSmall,
    );
  }
}
