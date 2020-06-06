import 'package:flutter/material.dart';
import 'package:covidtracker/screens/combinedscreen.dart';

class Allstates extends StatelessWidget {
  var myData;
  var myDistrictData;
  var myDailydata;
  Allstates(this.myData,this.myDistrictData,this.myDailydata);
  @override
  Widget build(BuildContext context) {
    return Container(
     child:  CombinedScreen(myData['statewise'],'state'),
    );
  }
}