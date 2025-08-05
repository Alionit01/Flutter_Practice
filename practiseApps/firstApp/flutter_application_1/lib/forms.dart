import 'package:flutter/material.dart';
import 'package:flutter_application_1/details.dart';

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  var _productName;
  final _productController = TextEditingController();
  final _productDController = TextEditingController();
  bool? _checkBox = false;
  bool? _listTileCheckBox = false;

  @override
  void dispose() {
    // just for better memory managemnt
    _productController.dispose();
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
              prefixIconColor: Colors.deepPurple.shade300, ),
                SizedBox(height: 10.0), 
            MyTextField(
              fieldName: 'Product Description',
              myController: _productDController,
              myIcon: Icons.description_outlined,
              prefixIconColor: Colors.deepPurple.shade300, ),
              SizedBox(height: 10.0),
             myBtn(context),
            // 1.   CheckBox
              Checkbox(
                value: _checkBox,
                checkColor: Colors.white,
                activeColor: Colors.deepPurple,
                tristate: true,
                onChanged: (value) {
                  setState(() {
                    _checkBox = value;
                  });
                },
              ),
//2.   CheckBoxListTile
              CheckboxListTile(
                value: _listTileCheckBox,
                checkColor: Colors.white,
                activeColor: Colors.deepPurple,
                tristate: true,
                title: Text("Top Product"),
                onChanged: (value) {
                  setState(() {
                    _listTileCheckBox = value;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading, //Leading Checkbox Icon
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
        prefixIcon: Icon(myIcon, color: prefixIconColor,),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurple.shade300)
        ),
        labelStyle: const TextStyle(color: Colors.deepPurple)
      ),
    );
  }
}

class MyCheckBox extends StatefulWidget {
  MyCheckBox({super.key, required this.listTileCheckBox});

  bool? listTileCheckBox;

  @override
  State<MyCheckBox> createState() => _MyCheckBoxState();
}

class _MyCheckBoxState extends State<MyCheckBox> {
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
              value: widget.listTileCheckBox,
              onChanged: (val) {
                setState(() => widget.listTileCheckBox = val);
              },
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