import 'package:flutter/material.dart';
import 'package:news_application/constants/app_theme.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  const NewsItem({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    DateTime dateTime = DateTime.now().subtract(Duration(minutes: 31));

    return Container(
      padding: EdgeInsets.all(9),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(width: 1, color: AppTheme.white),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'assets/images/news2.png',
              height: MediaQuery.sizeOf(context).height * 0.25,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Nobel Prize in physics awarded to two\nscientists for machine learning discoveries',
            style: textTheme.titleMedium,
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('By : Jone Haworth', style: textTheme.labelSmall),
              Text(timeago.format(dateTime), style: textTheme.labelSmall),
            ],
          ),
        ],
      ),
    );
  }
}
