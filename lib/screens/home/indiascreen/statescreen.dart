import 'package:flutter/material.dart';

class Statescreen extends StatelessWidget {
var myData;
  var myDistrictData;
  var myDailydata;
  var statename;
  int index;
  Statescreen({this.myData,this.myDistrictData,this.myDailydata,this.statename,this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        title: Text(statename),
       
      elevation: 0,
      
      ),
    );
  }
}