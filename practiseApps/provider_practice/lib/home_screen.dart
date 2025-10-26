import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/list_provider.dart';
import 'package:provider_practice/second_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Consumer<numListProvider>(
      builder: (BuildContext context, numListProvider value, Widget? child) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            
            onPressed: (){
             value.add();
            },
            child: Icon(Icons.add),
          ),
          appBar: AppBar(title: Text("Home"),),
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
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     ElevatedButton(onPressed: (){
                      value.subs();
                    }, 
                    
                    child: Container(
                      width: 75,
                      height: 75,
                      child: Text("Minus 1"),
                    )
                    ),
                    ElevatedButton(onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const SecondScreen()));
                    }, 
                    child: Container(
                      width: 50,
                      height: 50,
                      child: Text("Next page"),
                    )
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}