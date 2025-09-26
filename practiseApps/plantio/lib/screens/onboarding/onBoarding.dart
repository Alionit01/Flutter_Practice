import 'package:flutter/material.dart';
import 'package:plantio/screens/dashboard/dashboard.dart';
import 'package:plantio/screens/dashboard/home_screen.dart';
import 'package:plantio/screens/login/login_page.dart';
import 'package:plantio/wigets/onboardingCard.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  static final PageController _pageController = PageController(initialPage: 0);

  // ignore: prefer_final_fields
  List<Widget> _pages = [
    OnboardingCard(
      image: "assets/images/onboardingScreen1.png",
      title: "Identify Plants",
      discription: "You can identify the plants you don't know \n through your camera",
      ),
      OnboardingCard(
      image: "assets/images/onboardingScreen2.png",
      title: "Learn Many Plants Species",
      discription: "Let's learn about the many plant species that exist in this world",
      ),
      OnboardingCard(
      image: "assets/images/onboardingScreen3.png",
      title: "Read Many Articles About Plant",
      discription: "Let's learn more about beautiful plants and read many articles about plants and gardening",
      ),
    
  ];
  

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: PageView(controller: _pageController, children: _pages),
            ),
            SmoothPageIndicator(
              controller: _pageController,
              count: 3,
              effect: const WormEffect(
                dotHeight: 8.0,
                dotWidth: 8.0,
                spacing: 6.0,
                dotColor: Colors.grey,
                activeDotColor: Colors.greenAccent,
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            MaterialButton(
             onPressed: () {
    if (_pageController.page!.toInt() < _pages.length - 1) {
      _pageController.nextPage(
        duration: Durations.long1,
        curve: Curves.linear,
      );
    } else {
      Navigator.push(
        context, MaterialPageRoute(
          builder: (context) => const Dashboard(),
        ),
        );
    }
  },
              color: Color(0xFF2DDA93),
              textColor: Colors.white,
              child: Text("NEXT"),
              ),

              SizedBox(height: screenHeight * 0.08),
          ],
        ),
      ),
    );
  }
}
