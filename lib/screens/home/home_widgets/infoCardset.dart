import 'dart:convert';

import 'package:covidtracker/constants.dart';
import 'package:covidtracker/stats/statistics.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import './Infocard.dart';

class Infoset extends StatelessWidget {
  final statistics;
  Infoset(this.statistics);
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

      child: Container(
        child: Card(
          child: Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Infocard(statistics),
                    ),
                    // Expanded(
                    //   child: Infocard(statistics),
                    // ),
                  ],
                ),
              ),
              // Expanded(
              //   child: Column(
              //     children: <Widget>[
              //       Expanded(
              //         child: Infocard(statistics),
              //       ),
              //       Expanded(
              //         child: Infocard(statistics),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          )),
        ),
      ),

      // child: GridView(
      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //       crossAxisCount: 2, childAspectRatio: 300/200),
      //   children: <Widget>[
      //        Infocard(
      //         title: 'Total Cases',
      //         effectedNum: data['confirmed'],
      //         iconcolor: Colors.orange[100],
      //       ),

      //     Infocard(
      //       title: 'Active Cases',
      //       effectedNum: data['active'],
      //       iconcolor: Colors.orange[100],
      //     ),
      //     Infocard(
      //       title: 'Deaths',
      //       effectedNum: data['deaths'],
      //       iconcolor: Colors.orange[100],
      //     ),
      //     Infocard(
      //       title: 'Recovered',
      //       effectedNum: data['recovered'],
      //       iconcolor: Colors.orange[100],
      //     ),
      //   ],
      // ),
    );
  }
}
