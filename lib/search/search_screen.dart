import 'package:flutter/material.dart';
import 'package:news_application/API/api_services.dart';
import 'package:news_application/constants/app_theme.dart';
import 'package:news_application/news/news_item.dart';
import 'package:news_application/widgets/error_indicator.dart';
import 'package:news_application/widgets/loading_indicator.dart';

class SearchScreen extends StatefulWidget {
  // final List<Articles> articles;
  final String? categoryId;

  const SearchScreen({super.key, this.categoryId});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  bool isSearching = false;
  String query = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.black,
        centerTitle: true,
        title: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppTheme.white, width: 1),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Icon(Icons.search_rounded, color: AppTheme.white, size: 30),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: searchController,
                    autofocus: true,
                    style: TextStyle(color: AppTheme.white, fontSize: 20),
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
                        query = value;
                      });
                    },
                  ),
                ),
                if (isSearching)
                  GestureDetector(
                    onTap: () {
                      searchController.clear();
                      setState(() => isSearching = false);
                    },
                    child: const Icon(
                      Icons.close_rounded,
                      color: AppTheme.white,
                      size: 30,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: APIServices.fetchNews(widget.categoryId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return LoadingIndicator();
                  } else if (snapshot.hasError) {
                    return ErrorIndicator();
                  } else {
                    final articles = snapshot.data ?? [];

                    print("Articles Length: ${articles.length}");

                    final results = query.isEmpty
                        ? articles
                        : articles
                              .where(
                                (article) => (article.title ?? "")
                                    .toLowerCase()
                                    .contains(query.toLowerCase()),
                              )
                              .toList();

                    print("Query: $query");
                    print("Results Length: ${results.length}");

                    return ListView.builder(
                      itemCount: results.length,
                      itemBuilder: (_, index) => NewsItem(results[index]),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
