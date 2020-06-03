import 'package:flutter/material.dart';

class CountryWorld extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 180,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Card(
            elevation: 5,
            child: Image.asset('assets/images/india.jpg'),
          ),
          Card(
            elevation: 5,
            child: Image.asset('assets/images/world.jpg'),
          ),
        ],
      ),
    );
  }
}
