import 'package:flutter/material.dart';
import 'package:covidtracker/constants.dart';
class Country extends StatelessWidget {
  final String name;
  Country(this.name);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
       backgroundColor: kPrimaryColor,
      ),
     
    );
  }
}