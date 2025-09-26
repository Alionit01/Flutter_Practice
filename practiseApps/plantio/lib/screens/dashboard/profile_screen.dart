import 'package:flutter/material.dart';
import 'package:plantio/wigets/profile_top_section.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileTopSection(),

        SizedBox(height: 10,),
        Expanded(
  child: ListView(
    padding: EdgeInsets.zero, 
    children: [
      
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("ARTICLES", style: TextStyle(color: Colors.grey[500])),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                "SPECIES",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            Text("LIKES", style: TextStyle(color: Colors.grey[500])),
          ],
        ),
      ),

      // Title
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
        child: Text(
          "Your Collected Plants",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      const SizedBox(height: 8),

      // Plant name + date
      
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 16.0),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: const [
      Row(
        children: [
          Icon(Icons.radio_button_checked, color: Colors.blue, size: 16),
          SizedBox(width: 6),
          Text(
            "Alagatre Plant",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
      ),
      SizedBox(height: 4, ),
      Padding(
        padding: EdgeInsets.only(left: 20.0),
        child: Text(
          "02 . 01 . 2019",
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ),
    ],
  ),
),


      // Image grid
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset("assets/images/profileSecImg1.jpg",
                  fit: BoxFit.cover),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset("assets/images/profileSecImg2.jpg",
                  fit: BoxFit.cover),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset("assets/images/profileSecImg3.jpg",
                  fit: BoxFit.cover),
            ),
          ],
        ),
      ),
    ],
  ),
),

     
     
     
     
     
     
     
      ],
    );
  }
}
