import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({super.key});

  List<String> products = ["Bed", "Table", "Chair"];
  List<String> productDetails = ["King Size Bed", "Wooden Table", "Wooden Chair"];
  List<int> price = [30000, 5000, 8000];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Navigation Drawer"),),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountEmail: Text("iamAlive@gmail.com"),
              accountName: Text("TUPAC"),
              currentAccountPicture: CircleAvatar(foregroundImage: AssetImage("assets/smileyFace.png"),),
              
            ),
            ListTile(leading: Icon(Icons.home), title: Text("Home"),),
            ListTile(leading: Icon(Icons.shopping_cart), title: Text("Shop"),),
            ListTile(leading: Icon(Icons.favorite), title: Text("Favorites"),),
            Padding(
            padding: const EdgeInsets.all(14.0),
            child: Text("Labels"),
            ),
            ListTile(leading: Icon(Icons.label), title: Text("Home"),),
            ListTile(leading: Icon(Icons.label), title: Text("Shop"),),
            ListTile(leading: Icon(Icons.label), title: Text("Favorites"),),
             
          ],
        ),
      ),

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
