import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/models/article.dart';

class CardArticle extends StatelessWidget {
  final Article article;

  CardArticle({required this.article});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(article.title),
      subtitle: Text(article.author ?? 'Unknown'),
      onTap: () {
        Get.toNamed('/article_detail', arguments: article);
      },
    );
  }
}
