import 'package:flutter/material.dart';
class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
    BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            title: Text('India'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flag),
            title: Text('World'),
            
          ),
        ],
        
        selectedItemColor: Colors.purple[300],
    ) 
      
    ;
  }
}