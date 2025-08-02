import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Container(
      child: ListView(
        children: [
          ListTile(
            leading: CircleAvatar(child: Icon(Icons.alarm_on_sharp), backgroundColor: Colors.green[200],),
            title: Text("Sales"),
            subtitle: Text("Sales of week"),
            trailing: Text("3500"),
            onTap: (){},
          ),
           ListTile(
            leading: Icon(Icons.alarm_on_sharp),
            title: Text("Sales"),
            subtitle: Text("Customers"),
            trailing: Text("30"),
            onTap: (){},
          ), ListTile(
            leading: Icon(Icons.alarm_on_sharp),
            title: Text("Sales"),
            subtitle: Text("Profit"),
            trailing: Text("500"),
            onTap: (){},
          ),
        ],
      ),
     ),
    );
  }
}
