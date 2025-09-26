import 'package:flutter/material.dart';
import 'package:plantio/screens/dashboard/home_screen.dart';
import 'package:plantio/wigets/search_widget.dart';

class TopCategorySection extends StatelessWidget {
  final ValueChanged<String>? onSearchChanged;
  final String title;
  const TopCategorySection({super.key, this.onSearchChanged, required this.title});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: screenHeight * 0.214, 
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: screenHeight * 0.30, 
            width: double.infinity,
            color: const Color(0xFF29D890),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05,
                vertical: screenHeight * 0.045,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      IconButton(
                        onPressed: () {
                         Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));

                        },
                        icon: const Icon(Icons.arrow_back_rounded),
                        color: Colors.white,
                        iconSize: 30,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.menu),
                        color: Colors.white,
                        iconSize: 30,

                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                    
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          
          Positioned(
            left: 20,
            right: 20,
            bottom: -20,
            child: SizedBox(
              
              height: 50,
              child: MySearchWidget(onChanged: onSearchChanged),
            ),
          ),
        ],
      ),
    );
  }
}
