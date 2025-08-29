import 'package:flutter/material.dart';
import 'package:news_application/news/data/models/news_response.dart';
import 'package:news_application/shared/constants/app_theme.dart';

import '../../../widgets/article_details_bottomSheet.dart';

class NewsItem extends StatelessWidget {
  final Articles article;

  NewsItem(this.article, {super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    DateTime dateTime = DateTime.now().subtract(Duration(minutes: 31));

    return GestureDetector(
      onTap: () {
        articleDetailsBottomSheet(context, article);
      },
      child: Container(
        padding: EdgeInsets.all(9),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(width: 1, color: AppTheme.white),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                article.urlToImage ??
                    'https://static.vecteezy.com/system/resources/previews/022/059/000/non_2x/no-image-available-icon-vector.jpg',
                height: MediaQuery.sizeOf(context).height * 0.25,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: 10),
            Text(article.title!, style: textTheme.titleMedium),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'By : ${article.author ?? article.source!.name}',
                  style: textTheme.labelSmall,
                ),
                // Text(
                //       timeago.format(article.publishedAt),
                //   style: textTheme.labelSmall,
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void articleDetailsBottomSheet(BuildContext context, Articles article) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: AppTheme.white,
      builder: (_) => ArticleDetailsScreen(article: article),
    );
  }
}
