import 'package:covidtracker/stats/statistics.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Statescreen extends StatefulWidget {
final Statistics statistics;
 final  stateName;
  final  index;
  Statescreen(
      {this.statistics,
      this.stateName,
      this.index});

  @override
  _StatescreenState createState() => _StatescreenState();
}

class _StatescreenState extends State<Statescreen> {
  Statistics statistics;
  var myStateName;
  var myStateCode;
  var myIndex;
  var count = 0;
  var filteredData;
  var filterCounter = 0;
  var items;
  List<Widget> districtsList = [];
  List<FlSpot> spots = [];
  List<Color> colors;
  var asofDate;
  var activeRate;
  var recoveryRate;
  var mortalityRate;


  @override
  void initState() {
    setState(() {
      statistics=widget.statistics;
      myStateName = widget.stateName;
      myIndex = widget.index;
    });
  
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('jjj'),
        elevation: 0,
      ),
    );
  }
}