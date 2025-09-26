import 'package:flutter/material.dart';
import 'package:plantio/wigets/article_card.dart';
import 'package:plantio/wigets/topCategorySection.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TopCategorySection(title: "Articles",),
          Expanded(
            child: ListView(
              children: const [
                ArticleCard(image: 'assets/images/articleImg1.jpg',
                title: 'David Austin, Who Breathed Life Into the Rose, Is Dead at 92'),
                ArticleCard(image: 'assets/images/articleImg2.jpg',
                title: "Even on Urban Excursions, Finding Mother Nature's Charms"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
