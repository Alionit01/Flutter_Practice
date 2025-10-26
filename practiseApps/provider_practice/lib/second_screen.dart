import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/list_provider.dart';

class SecondScreen extends StatefulWidget {
  
  const SecondScreen({super.key });
//fix cosnt problem
  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return  Consumer<numListProvider>(
      builder: (context, numListProvider value, child) => 
      Scaffold(
        floatingActionButton: FloatingActionButton(
          
          onPressed: (){
           value.add();
          },
          child: Icon(Icons.add),
          ),
        appBar: AppBar(title: Text("Second Page"),),
        body: SizedBox(
          child: Column(
            children: [
              Text(value.nums.last.toString(), textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
      
              ),
              ),
      
              Expanded(child: ListView.builder(
                itemCount: value.nums.length,
                itemBuilder: (context, index){
                  return Text(
                    value.nums[index].toString(),
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  
                  );
                }
              ))
            ],
          ),
        ),
      ),
    );
  }
}