import 'package:flutter/material.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
            color: Colors.grey[100],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Search"),
              Icon(
                Icons.search,
                color: Colors.grey,
                ),
            ],
          ),
        ),

      Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 25.0),
        child: Text(
          "It is the stop that kills you.. not the fall",
          style: TextStyle(color: Colors.grey[600]),
          ),
         ),

      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: const [
          Text("Hot Picks",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            ),
          ),
           Text("See all",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blue,
            ),
          ),
          ],
        ),
      )

      ],
    );
  }
}