import 'dart:convert';

import 'package:covidtracker/constants.dart';
import 'package:flutter/material.dart';

import './Infocard.dart';

class Infoset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
            padding: EdgeInsets.all(10),
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              color: kPrimaryColor.withOpacity(0.03),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 300 / 220),
              children: <Widget>[
                // FutureBuilder(
                //   future: getWorldStats(),
                //   builder:(BuildContext context,Snapshot){
                //     if(Snapshot.hasData)
                //     {
                //       return 
                //     }
                //   },
                // ),
               
                Infocard(title:'Total Cases',effectedNum:'5256' ,iconcolor: Colors.orange[100],),
                Infocard(title:'Total Cases',effectedNum: '1073',iconcolor: Colors.orange[100],),
                Infocard(title:'Total Cases',effectedNum: '555',iconcolor: Colors.orange[100],),
                Infocard(title:'Total Cases',effectedNum: '546',iconcolor: Colors.orange[100],),
                
              ],
            ),
          );
  }
}