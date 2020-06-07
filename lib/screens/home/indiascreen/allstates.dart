import 'package:covidtracker/stats/statistics.dart';
import 'package:flutter/material.dart';
import 'package:covidtracker/screens/combinedscreen.dart';

class Allstates extends StatelessWidget {
 final  Statistics statistics;
  Allstates(this.statistics);
 
 
  @override
  Widget build(BuildContext context) {
    return Container(
      
     child:  CombinedScreen(statistics,statistics.data['statewise'],'state'),
    );
  }
}