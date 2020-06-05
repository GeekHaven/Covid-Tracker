//import 'package:covidtracker/stats/indiastats.dart';
import 'package:flutter/material.dart';

class CountryWorld extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(30),
      // ),
      padding: EdgeInsets.all(10),
      height: 180,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FlatButton(
            onPressed: () {},
            child: Card(
              elevation: 5,
              child: Image.asset('assets/images/india.jpg'),
            ),
          ),
          FlatButton(
            onPressed: () {},
            child: Card(
              elevation: 5,
              child: Image.asset('assets/images/world.jpg'),
            ),
          ),
        ],
      ),
    );
  }
}
