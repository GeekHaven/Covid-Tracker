import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      unselectedFontSize: 15,
      selectedFontSize: 20,
      currentIndex: _currentindex,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            backgroundColor: Colors.purple),
        BottomNavigationBarItem(
            icon: Icon(Icons.panorama_fish_eye),
            title: Text("News"),
            backgroundColor: Colors.purple)
      ],
      onTap: (index) {
        setState(() {
          _currentindex = index;
        });
      },
    );
  }
}
