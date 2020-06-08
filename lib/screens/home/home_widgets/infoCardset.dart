//import 'dart:convert';

import 'package:covidtracker/constants.dart';
import 'package:flutter/material.dart';
//import 'package:auto_size_text/auto_size_text.dart';
import './Infocard.dart';

class Infoset extends StatelessWidget {
  final indiaData;
  Infoset(this.indiaData);
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(10),
       height: 200,
      width: double.infinity,
      // decoration: BoxDecoration(
      //   color: kPrimaryColor.withOpacity(0.03),
      //   borderRadius: BorderRadius.only(
      //     bottomLeft: Radius.circular(50),
      //     bottomRight: Radius.circular(50),
      //   ),
      // ),

    

      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 200/80),
        children: <Widget>[
             Infocard(
              title: 'Total Cases',
              effectedNum: indiaData['statewise'][0]['confirmed'],
              color: Colors.red,
              iconcolor: "red",
              increase:indiaData['statewise'][0]['deltaconfirmed'],
            ),

          Infocard(
            title: 'Active Cases',
            effectedNum: indiaData['statewise'][0]['active'],
            increase: '',
            color: Colors.blue,
            iconcolor: "blue",
            
          ),
          Infocard(
            title: 'Deaths',
            effectedNum: indiaData['statewise'][0]['deaths'],
            color: Colors.grey,
            iconcolor: "grey",
            increase:indiaData['statewise'][0]['deltadeaths'],
          ),
          Infocard(
            title: 'Recovered',
            effectedNum: indiaData['statewise'][0]['recovered'],
            color: Colors.green,
            iconcolor: "green",
            increase:indiaData['statewise'][0]['deltarecovered'],
          ),
        ],
      ),
    );
  }
}
