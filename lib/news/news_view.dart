import 'package:flutter/material.dart';
import 'package:news_application/API/api_services.dart';
import 'package:news_application/constants/app_theme.dart';
import 'package:news_application/models/news_response.dart';
import 'package:news_application/news/news_item.dart';
import 'package:news_application/news/tab_item.dart';
import 'package:news_application/widgets/error_indicator.dart';
import 'package:news_application/widgets/loading_indicator.dart';

import '../models/sources_response.dart';

class NewsView extends StatefulWidget {
  String categoryId;

  NewsView({required this.categoryId});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  int currentIndex = 0;
  late Articles article;
  late Future<SourcesResponse> getSourcesFuture = APIServices.getSources(
    widget.categoryId,
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getSourcesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingIndicator();
        } else if (snapshot.hasError || snapshot.data?.status != 'ok') {
          print("Error: ${snapshot.error} , status: ${snapshot.data?.status}");
          return ErrorIndicator();
        } else {
          List<Sources> sources = snapshot.data?.sources ?? [];
          print("Sources Length: ${sources.length}");
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
                child: FutureBuilder(
                  future: APIServices.getNews(sources[currentIndex].id!),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return LoadingIndicator();
                    } else if (snapshot.hasError ||
                        snapshot.data?.status != 'ok') {
                      return ErrorIndicator();
                    } else {
                      List<Articles> newsList = snapshot.data?.articles ?? [];
                      print("News Length: ${newsList.length}");
                      return ListView.separated(
                        padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                        itemBuilder: (_, index) => NewsItem(newsList[index]),
                        separatorBuilder: (_, index) => SizedBox(height: 16),
                        itemCount: newsList.length,
                      );
                    }
                  },
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
