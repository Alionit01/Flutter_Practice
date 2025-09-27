import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_api_1/models/postemodel.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Postsmodel> postlist = [];

  Future<List<Postsmodel>> getPostApi ()
 async {
    var response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    var data =jsonDecode(response.body.toString());
    if (response.statusCode == 200){
      for (var i in data) {
        postlist.add(Postsmodel.fromJson(i as Map<String, dynamic>)); // diff from tutorial
      }
      return postlist;
    }
      else{
return postlist;
      }
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("home"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getPostApi(),
              builder: (context, snapshot){
                if(!snapshot.hasData){
                  return Text("Loading");
                }
                return ListView.builder(
                  itemCount: postlist.length,
                  itemBuilder:(context, index) {
                    return Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Title",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                          Text(postlist[index].title.toString()),
                          Text("Discription",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                          Text(postlist[index].body.toString())
                        ],
                      )
                      );
                  },
                );
              }
            ),
          )
        ],
      ),

    );
  }
}