//import 'dart:convert';

import 'package:covidtracker/constants.dart';
import 'package:flutter/material.dart';

import './Infocard.dart';

class Infoset extends StatelessWidget {
  final  data;
  Infoset(this.data);
  @override
  Widget build(BuildContext context) {
    return Container(
     // padding: EdgeInsets.all(10),
     // height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        color: kPrimaryColor.withOpacity(0.03),
        // borderRadius: BorderRadius.only(
        //   bottomLeft: Radius.circular(50),
        //   bottomRight: Radius.circular(50),
        // ),
      ),
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 300/200),
        children: <Widget>[
             Infocard(
              title: 'Total Cases',
              effectedNum: data['confirmed'],
              iconcolor: Colors.orange[100],
            ),
          
          Infocard(
            title: 'Active Cases',
            effectedNum: data['active'],
            iconcolor: Colors.orange[100],
          ),
          Infocard(
            title: 'Deaths',
            effectedNum: data['deaths'],
            iconcolor: Colors.orange[100],
          ),
          Infocard(
            title: 'Recovered',
            effectedNum: data['recovered'],
            iconcolor: Colors.orange[100],
          ),
        ],
      ),
    );
  }
}
