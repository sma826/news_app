import 'package:flutter/material.dart';
import 'package:news_application/constants/app_theme.dart';
import 'package:news_application/models/source_model.dart';
import 'package:news_application/news/news_item.dart';
import 'package:news_application/news/tab_item.dart';

class NewsView extends StatefulWidget {
  String categoryId;

  NewsView({required this.categoryId});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  int currentIndex = 0;

  List<SourceModel> sources = List.generate(
    10,
    (index) => SourceModel(id: '$index', name: 'Source $index'),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: sources.length,
          child: TabBar(
            isScrollable: true,
            dividerColor: Colors.transparent,
            indicatorColor: AppTheme.white,
            tabAlignment: TabAlignment.start,
            labelPadding: EdgeInsetsDirectional.only(start: 16),
            tabs: sources
                .map(
                  (source) => TabItem(
                    source: source,
                    isSelected: currentIndex == sources.indexOf(source),
                  ),
                )
                .toList(),
            onTap: (index) {
              if (currentIndex == index) return;
              currentIndex = index;
              setState(() {});
            },
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.only(left: 16, right: 16, top: 16),
            itemBuilder: (_, index) => NewsItem(),
            separatorBuilder: (_, index) => SizedBox(height: 16),
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}
