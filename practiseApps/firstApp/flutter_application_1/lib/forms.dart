import 'package:flutter/material.dart';
import 'package:flutter_application_1/details.dart';

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
  ProductTypeEnum _productTypeEnum = ProductTypeEnum.Downloadable; // Added default value

  final _productSizeList = ["Small", "Medium", "Large", "XLarge"];
 
  _MyFormState(){
    _selectedVal = _productSizeList[0];
  }
 
  String? _selectedVal = "";

  @override
  void dispose() {
    _productController.dispose();
    _productDController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Form"), centerTitle: true),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: [
            const Text("Add products details"),
            SizedBox(height: 30.0),
            MyTextField(
              fieldName: 'Product Name',
              myController: _productController,
              myIcon: Icons.propane_outlined,
              prefixIconColor: Colors.deepPurple.shade300,
            ),
            SizedBox(height: 10.0),
            MyTextField(
              fieldName: 'Product Description',
              myController: _productDController,
              myIcon: Icons.description_outlined,
              prefixIconColor: Colors.deepPurple.shade300,
            ),
            SizedBox(height: 10.0),
            myBtn(context),
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
           
          ],
        ),
      ),
    );
  }

  OutlinedButton myBtn(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(minimumSize: const Size(200, 50)),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return Details(productName: _productController.text);
            },
          ),
        );
      },
      child: Text(
        "Submit",
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    required this.fieldName,
    required this.myController,
    this.myIcon = Icons.verified_user_outlined,
    this.prefixIconColor = Colors.blueAccent,
  });

  final TextEditingController myController;
  final String fieldName;
  final IconData myIcon;
  final Color prefixIconColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myController,
      decoration: InputDecoration(
        labelText: fieldName,
        prefixIcon: Icon(myIcon, color: prefixIconColor),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurple.shade300),
        ),
        labelStyle: const TextStyle(color: Colors.deepPurple),
      ),
    );
  }
}

class MyCheckBox extends StatelessWidget {
  const MyCheckBox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final bool? value;
  final ValueChanged<bool?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.deepPurple.shade50,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Checkbox(
              checkColor: Colors.white,
              activeColor: Colors.deepPurple,
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
