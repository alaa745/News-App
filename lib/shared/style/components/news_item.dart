import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:newsapp/api/model/news_response/article.dart';
import 'package:newsapp/api/model/sources_response/source.dart';

class NewsItem extends StatelessWidget {
  Article? article;

  NewsItem({required this.article});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Container(
        margin: EdgeInsets.only(top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(article?.urlToImage ?? ''),
                    fit: BoxFit.cover),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              article!.source!.name!,
              style: const TextStyle(
                fontSize: 10,
                color: Color(0xFF79828B),
              ),
            ),
            Text(
              article!.title!,
              style: const TextStyle(
                fontSize: 15,
                color: Color(0xFF42505C),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  article!.publishedAt!,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Color(0xFF79828B),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
