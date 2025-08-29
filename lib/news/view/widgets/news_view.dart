import 'package:flutter/material.dart';
import 'package:news_application/news/data/models/news_response.dart';
import 'package:news_application/news/view/widgets/news_item.dart';
import 'package:news_application/news/view_model/news_view_model.dart';
import 'package:news_application/shared/constants/app_theme.dart';
import 'package:news_application/shared/widgets/error_indicator.dart';
import 'package:news_application/shared/widgets/loading_indicator.dart';
import 'package:news_application/sources/view/widgets/tab_item.dart';
import 'package:news_application/sources/view_model/sources_view_model.dart';
import 'package:provider/provider.dart';

import '../../../sources/data/models/sources_response.dart';

class NewsView extends StatefulWidget {
  String categoryId;

  NewsView({required this.categoryId});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  int currentIndex = 0;
  SourcesViewModel sourcesViewModel = SourcesViewModel();
  NewsViewModel newsViewModel = NewsViewModel();
  late Articles article;

  @override
  void initState() {
    super.initState();
    sourcesViewModel.getSources(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => sourcesViewModel,
      child: Consumer<SourcesViewModel>(
        builder: (_, viewModel, _) {
          if (viewModel.isLoading) {
            return LoadingIndicator();
          } else if (viewModel.errorMessage != null) {
            return ErrorIndicator(viewModel.errorMessage!);
          } else {
            List<Sources> sources = viewModel.sources;
            newsViewModel.getNews(viewModel.sources[currentIndex].id!);

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
                  child: ChangeNotifierProvider(
                    create: (_) => newsViewModel,
                    child: Consumer<NewsViewModel>(
                      builder: (_, viewModel, _) {
                        if (viewModel.isLoading) {
                          return LoadingIndicator();
                        } else if (viewModel.errorMessage != null) {
                          return ErrorIndicator();
                        } else {
                          List<Articles> newsList = viewModel.newsList;
                          print("News Length: ${newsList.length}");
                          return ListView.separated(
                            padding: EdgeInsets.only(
                              left: 16,
                              right: 16,
                              top: 16,
                            ),
                            itemBuilder: (_, index) =>
                                NewsItem(newsList[index]),
                            separatorBuilder: (_, index) =>
                                SizedBox(height: 16),
                            itemCount: newsList.length,
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
