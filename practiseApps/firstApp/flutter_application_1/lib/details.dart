import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/product_modal.dart';
import 'package:flutter_application_1/forms.dart';

class Details extends StatelessWidget {
  Details({super.key, required this.productDetails });

  ProductDetails productDetails;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(productDetails.productName),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Card(
              child: ListTile(
                leading: Icon(Icons.shopping_bag, color: Colors.deepOrange),
                title: Text('Product Name'),
                subtitle: Text(productDetails.productName),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.description, color: Colors.deepOrange),
                title: Text('Description'),
                subtitle: Text(productDetails.productDetails),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.category, color: Colors.deepOrange),
                title: Text('Product Type'),
                subtitle: Text(productDetails.productType.toString().split('.').last),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.straighten, color: Colors.deepOrange),
                title: Text('Size'),
                subtitle: Text(productDetails.productSize),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(
                  productDetails.isTopProduct ? Icons.star : Icons.star_border,
                  color: productDetails.isTopProduct ? Colors.amber : Colors.grey,
                ),
                title: Text('Top Product'),
                subtitle: Text(productDetails.isTopProduct ? 'Yes' : 'No'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
