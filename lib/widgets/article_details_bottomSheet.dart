import 'package:flutter/material.dart';
import 'package:news_application/news/data/models/news_response.dart';
import 'package:news_application/shared/constants/app_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleDetailsScreen extends StatefulWidget {
  Articles article;

  ArticleDetailsScreen({super.key, required this.article});

  @override
  State<ArticleDetailsScreen> createState() => _ArticleDetailsScreenState();
}

class _ArticleDetailsScreenState extends State<ArticleDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 8,
        children: [
          SizedBox(
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                widget.article.urlToImage ??
                    'https://static.vecteezy.com/system/resources/previews/022/059/000/non_2x/no-image-available-icon-vector.jpg',
                fit: BoxFit.cover,
                // height: MediaQuery.sizeOf(context).height * 0.28,
              ),
            ),
          ),
          Text(
            widget.article.description!,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              fontFamily: 'inter',
              color: AppTheme.black,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _launcherURL(widget.article);
            },
            child: Text('View Full Article'),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  void _launcherURL(Articles article) async {
    final Uri url = Uri.parse(
      article.url!.startsWith('http')
          ? article.url!
          : "https://${article.url!}",
    );

    print("Opening URL: ${article.url}");

    if (!await launchUrl(url, mode: LaunchMode.inAppWebView)) {
      throw Exception('Could not launch $url');
    }
  }
}
