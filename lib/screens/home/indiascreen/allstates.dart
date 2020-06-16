import 'package:covidtracker/stats/statistics.dart';
import 'package:flutter/material.dart';
import 'package:covidtracker/screens/combinedscreen.dart';

class Allstates extends StatelessWidget {
  var myData;
  var myDistrictData;
  var myDailydata;
  Allstates({this.myData,this.myDistrictData,this.myDailydata});
  @override
  Widget build(BuildContext context) {
    return Container(
     child:  CombinedScreen(myData: myData,myDistrictData: myDistrictData, myDailydata: myDailydata, datalist:myData['statewise'],text:'state'),
    );
  }
}