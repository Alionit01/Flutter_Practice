import 'package:flutter/material.dart';
import 'package:flutter_application_1/details.dart';

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form"),
        centerTitle: true,
      ),
      body: Center(
        child: myBtn(context),
        
      ),
    );
  }

  OutlinedButton myBtn(BuildContext context) {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(minimumSize: const Size(200,50)),
        onPressed: (){
          Navigator.push(context,
          MaterialPageRoute(builder: (context){
            return Details();
          })
          );
        },
        child: Text(
        "Submit",
        style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        );
  }
}