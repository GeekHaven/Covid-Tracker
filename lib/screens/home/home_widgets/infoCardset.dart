import 'dart:convert';

import 'package:covidtracker/constants.dart';
import 'package:covidtracker/stats/world.dart';
import 'package:flutter/material.dart';

import './Infocard.dart';

class Infoset extends StatelessWidget {
   final Wcases worlddata;
  Infoset(this.worlddata);
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
               
                Infocard(title:'Total Cases',effectedNum: worlddata.cases.toString(),iconcolor: Colors.orange[100],),
                Infocard(title:'Active Cases',effectedNum: worlddata.active.toString(),iconcolor: Colors.orange[100],),
                Infocard(title:'Total Deaths',effectedNum: worlddata.deaths.toString(),iconcolor: Colors.orange[100],),
                Infocard(title:'Total Recovered',effectedNum: worlddata.recovered.toString(),iconcolor: Colors.orange[100],),
                
              ],
            ),
          );
  }
}