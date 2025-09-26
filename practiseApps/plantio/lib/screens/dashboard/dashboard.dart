import 'package:flutter/material.dart';
import 'package:plantio/screens/dashboard/home_screen.dart';
import 'package:plantio/screens/dashboard/profile_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectIndex = 0;

  void onItemTap(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

 
  final List<Widget> _pages = const <Widget>[
    HomeScreen(),
    Icon(Icons.add, size: 150),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: _pages[_selectIndex],
      ),
      // Floating Action Button
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          _selectIndex= 1;
        }),
        backgroundColor: Color(0xFF48A2F5),
        foregroundColor: Colors.white,
        shape: const CircleBorder(),
          child: const Icon(Icons.add, size: 30),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      //Bottom Nav bar
      bottomNavigationBar: BottomNavigationBar(
        
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectIndex,
        selectedItemColor: Color(0xFF2DDA93),
        onTap: onItemTap,
      ),
    );
  }
}
