import 'package:flutter/material.dart';
import 'package:plantio/screens/categorry_screens/article_screen.dart';
import 'package:plantio/screens/categorry_screens/species_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero, 
        children: [
          // top container with search bar
          SizedBox(
            height: screenHeight * 0.214, 
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: screenHeight * 0.30,
                  width: double.infinity,
                  color: const Color(0xFF29D890),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.09),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Hello Taylor",
                              style: TextStyle(
                                fontSize: 18,
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
                        Image(
                          image: AssetImage("assets/images/icon1.png"),
                          width: 40,
                          height: 40,
                        ),
                      ],
                    ),
                  ),
                ),
      
                // Positioned search bar
                Positioned(
                  bottom: -(MediaQuery.of(context).size.height * 0.025), 
                  left: 20,
                  right: 20,
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(30),
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: "Search For Plants",
                        hintStyle: TextStyle(color: Color(0xFFD2D2D2)),
                        prefixIcon: Icon(Icons.search),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 15),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
      
          const SizedBox(height: 37),
      
          // categories row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              myCategContainer(
                iconText: Icons.camera_alt, title: 'IDENTIFY',
                onTap: (){
                  print("d");
                },
                ),
      
              myCategContainer(iconText: Icons.eco, title: 'SPECIES',
               onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_) => SpeciesScreen()));
                },
              ),
              myCategContainer(
                iconText: Icons.menu_book_outlined, title: 'ARTICLES',
                 onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_) => ArticleScreen()));
                },
                ),
            ],
          ),
      
          const SizedBox(height: 10),
      
          // Heading text
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
              child: const Text(
                "Plant Types",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
              ),
            ),
          ),
      
          const SizedBox(height: 10),
          // Horizontal list
          SizedBox(
            height: screenHeight * 0.18,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                myPlantCard(context, "assets/images/plantImg3.jpg", "Home Plants", "68 Types of Plants"),
                myPlantCard(context, "assets/images/plantImg2.jpg", "Huge Plants", "102 Type Of Plants"),
                myPlantCard(context, "assets/images/plantImg1.jpg", "Small Plants", "12 Type Of Plants"),
              ],
            ),
          ),
      
          const SizedBox(height: 10),
           Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
              child: const Text(
                "Photography",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
              ),
            ),
          ),
          
      
      SizedBox(
            height: 144,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                myPhotographyCard("assets/images/photographyImg1.jpg", "#New" ),
                myPhotographyCard("assets/images/plantImg2.jpg", "#cute"),
                myPhotographyCard("assets/images/plantImg3.jpg", "#Small"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget myPlantCard(BuildContext context, String image, String title, String discription) {
    return GestureDetector(
      onTap: () {
        final snackBar = SnackBar(
          content: Text('In progress'),
          backgroundColor: Colors.green,
          elevation: 10,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(5),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      child: Container(
        width: 299,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover
          ),
        ),
        margin: const EdgeInsets.only(right: 12),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              Text(
                discription,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}

  Widget myPhotographyCard(String image, String title) {
  return Container(
  width: 126,
  margin: const EdgeInsets.only(right: 12),
  decoration: BoxDecoration(
    image: DecorationImage(
      image: AssetImage(image,), 
      fit: BoxFit.cover,
    ),
    borderRadius: BorderRadius.circular(12), 
  ),
  child: Stack(
    children: [
      
      Positioned(
        bottom: 8,   
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.white70,
          ),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
      ),
    ],
  ),
);
  }



class myCategContainer extends StatelessWidget {
  final IconData iconText;
  final String title;
  final VoidCallback onTap; 

  const myCategContainer({
    Key? key,
    required this.iconText,
    required this.title,
    required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Material(
  color: const Color(0xFF2DDA93),
  borderRadius: BorderRadius.circular(4.0),
  child: InkWell(
    onTap: onTap,
    
    child: Container(
      width: screenWidth * 0.3,
      height: screenHeight * 0.105,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: screenHeight * 0.002,
            blurRadius: 6,
            offset: const Offset(2, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(iconText, color: Colors.white, size: 28),
          const SizedBox(height: 6),
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    ),
  ),
);

  }
}
