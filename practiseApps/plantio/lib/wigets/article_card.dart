import 'package:flutter/material.dart';

class ArticleCard extends StatelessWidget {
  final String image;
  final String title;
  const ArticleCard({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Image
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: Image.asset(
              image,
              height: 160,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          // Title
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          // Author and icons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
            child: Row(
              children: [
                
                CircleAvatar(
                  radius: 14,
                  backgroundImage: const AssetImage(
                    'assets/images/articleIconImg.jpg',
                  ),
                ),
                const SizedBox(width: 8),

                // Author and Date
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Shivani Vora',
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '2019.01.01',
                      style: TextStyle(fontSize: 11, color: Colors.grey),
                    ),
                  ],
                ),

                const Spacer(),

                // Icons
                IconButton(
                  icon: const Icon(Icons.bookmark_border),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.favorite_border),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
