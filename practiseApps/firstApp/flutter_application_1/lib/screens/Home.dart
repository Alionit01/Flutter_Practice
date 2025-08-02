import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({super.key});

  List<String> products = ["Bed", "Table", "Chair"];
  List<String> productDetails = ["King Size Bed", "Wooden Table", "Wooden Chair"];
  List<int> price = [30000, 5000, 8000];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Container(
      child: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index){
          return ListTile(
            leading: CircleAvatar(child: Text(products[index][0]),),
            title: Text(products[index]),
            subtitle: Text(productDetails[index]),
            trailing: Text(price[index].toString()),
            hoverColor: Colors.blueGrey,
          );
        }

        ),
     )
    );
  }
}
