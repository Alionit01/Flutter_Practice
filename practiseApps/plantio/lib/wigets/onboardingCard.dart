import 'package:flutter/material.dart';

class OnboardingCard extends StatelessWidget {
  final String image, title, discription;
  const OnboardingCard({
    super.key,
    required this.image,
    required this.title,
    required this.discription,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: screenHeight * 0.80,
      width: screenWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.1),
            child: Image.asset(
              image,
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Column(
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  discription,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
