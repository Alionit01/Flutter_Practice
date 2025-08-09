import 'package:flutter/material.dart';
import 'package:flutter_application_1/details.dart';
import 'package:flutter_application_1/models/product_modal.dart';
import 'package:flutter_application_1/widgets/myButton.dart';
import 'package:flutter_application_1/widgets/myTextField.dart';

enum ProductTypeEnum { Downloadable, Deliverable }

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _productController = TextEditingController();
  final _productDController = TextEditingController();
  bool? _listTileCheckBox = false;
  ProductTypeEnum _productTypeEnum = ProductTypeEnum.Downloadable;
  final _productSizeList = ["Small", "Medium", "Large", "XLarge"];

  final _formKey = GlobalKey<FormState>();
  

  String? _selectedVal;

  _MyFormState() {
    _selectedVal = _productSizeList[0];
  }

  @override
  void dispose() {
    _productController.dispose();
    _productDController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Form", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.teal,
        elevation: 4,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.teal.shade50, Colors.white],
          ),
        ),
        child: ListView(
          children: [
            Text(
              "Add Product Details",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.teal.shade800,
              ),
            ),
            SizedBox(height: 30.0),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  MyTextField(
                    fieldName: 'Product Name',
                    myController: _productController,
                    myIcon: Icons.propane_outlined,
                    prefixIconColor: Colors.deepOrange.shade300,
                  ),
                  SizedBox(height: 10.0),
                  MyTextField(
                    fieldName: 'Product Description',
                    myController: _productDController,
                    myIcon: Icons.description_outlined,
                    prefixIconColor: Colors.orange.shade300,
                  ),
                  SizedBox(height: 10.0),
                  MyCheckBox(
                    value: _listTileCheckBox,
                    onChanged: (val) {
                      setState(() {
                        _listTileCheckBox = val;
                      });
                    },
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      Expanded(
                        child: MyRadioButton(
                          title: ProductTypeEnum.Downloadable.name,
                          value: ProductTypeEnum.Downloadable,
                          groupValue: _productTypeEnum,
                          onChanged: (val) {
                            setState(() {
                              _productTypeEnum = val!;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: MyRadioButton(
                          title: ProductTypeEnum.Deliverable.name,
                          value: ProductTypeEnum.Deliverable,
                          groupValue: _productTypeEnum,
                          onChanged: (val) {
                            setState(() {
                              _productTypeEnum = val!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  DropdownButtonFormField(
                    value: _selectedVal,
                    items: _productSizeList
                        .map((e) => DropdownMenuItem(child: Text(e), value: e))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedVal = value;
                      });
                    },
                    icon: const Icon(
                      Icons.arrow_drop_down_circle,
                      color: Colors.deepOrange,
                    ),
                    dropdownColor: Colors.deepOrange.shade50,
                    decoration: InputDecoration(
                      labelText: "Product Sizes",
                      prefixIcon: Icon(
                        Icons.accessibility_new_rounded,
                        color: Colors.deepOrange,
                      ),
                      border: UnderlineInputBorder(),
                    ),
                  ),
                 SizedBox(height: 10.0),
                  MyButton(
                    onPress: () {
                      if (_formKey.currentState!.validate()) {

                        ProductDetails productDetails = ProductDetails();
                        productDetails.productName = _productController.text;
                        productDetails.productDetails = _productDController.text;
                        productDetails.isTopProduct = _listTileCheckBox!;
                        productDetails.productType = _productTypeEnum;
                        productDetails.productSize = _selectedVal!;

                        Navigator.push(
                          context, MaterialPageRoute(builder: (context){
                            return Details(productDetails: productDetails);
                          })  );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyCheckBox extends StatelessWidget {
  const MyCheckBox({super.key, required this.value, required this.onChanged});

  final bool? value;
  final ValueChanged<bool?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.deepOrange.shade50,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Checkbox(
              checkColor: Colors.white,
              activeColor: Colors.deepOrange,
              tristate: true,
              value: value,
              onChanged: onChanged,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: Text("Top Product"),
            ),
          ],
        ),
      ),
    );
  }
}

class MyRadioButton extends StatelessWidget {
  const MyRadioButton({
    super.key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  final String title;
  final ProductTypeEnum value;
  final ProductTypeEnum groupValue;
  final ValueChanged<ProductTypeEnum?> onChanged;

  @override
  Widget build(BuildContext context) {
    return RadioListTile<ProductTypeEnum>(
      title: Text(title),
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
    );
  }
}
