import 'package:flutter/material.dart';
import 'package:plantio/screens/dashboard/home_screen.dart';

class ProfileTopSection extends StatelessWidget {
  const ProfileTopSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: screenHeight * 0.30,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: screenHeight * 0.30,
            width: double.infinity,
            color: const Color(0xFF29D890),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  // Top row: Back + Menu
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const HomeScreen()),
                          );
                        },
                        icon: const Icon(Icons.arrow_back_rounded),
                        color: Colors.white,
                        iconSize: 28,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.menu),
                        color: Colors.white,
                        iconSize: 28,
                      ),
                    ],
                  ),

                  

                  // Middle section
                  const Column(
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundImage: AssetImage("assets/images/icon1.png"),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Hello Taylor",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Let’s Learn More About Plants",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
