import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:covidtracker/config.dart';

class Chart extends StatelessWidget {
  
  Chart({this.mySpots,this.chartColor});
  final mySpots;
  final List<Color> chartColor;


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 2,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(1.1 * SizeConfig.heightMultiplier),
                ),
                color: Colors.white,),
            child: Padding(
              padding: EdgeInsets.only(right: 4.2 * SizeConfig.widthMultiplier, left: 2.83 * SizeConfig.widthMultiplier, top: 2.61 * SizeConfig.heightMultiplier, bottom: 1.305 * SizeConfig.heightMultiplier),
              child: LineChart(
                mainData(mySpots,chartColor),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

List<Color> gradientColors = [
    const Color(0xFFFE0739),
  ];

LineChartData mainData(mySpots,List<Color> myColors) {

  List<FlSpot> spots = mySpots;
  return LineChartData(
    gridData: FlGridData(
      show: false,
    ),
    titlesData: FlTitlesData(
      show: true,
      bottomTitles: SideTitles(
        showTitles: false,
        reservedSize: 2.39 * SizeConfig.heightMultiplier,
        textStyle: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold, fontSize: 1.74 * SizeConfig.textMultiplier),
        getTitles: (value) {
          switch (value.toInt()) {
            case 2:
              return 'MAR';
            case 5:
              return 'JUN';
            case 8:
              return 'SEP';
          }
          return '';
        },
        margin: 0.89 * SizeConfig.heightMultiplier,
        
      ),
      leftTitles: SideTitles(
        showTitles: false,
        textStyle: TextStyle(
          color: Colors.purple,
          fontWeight: FontWeight.bold,
          fontSize: 1.635 * SizeConfig.heightMultiplier,
        ),
        getTitles: (value) {
          switch (value.toInt()) {
            case 100:
              return '100';
            case 300:
              return '300';
            case 500:
              return '500';
            case 1000:
              return '1000';
            case 2000:
              return '2000';
            case 3000:
              return '3000';
          }
          return '';
        },
        reservedSize: 2.4 * SizeConfig.textMultiplier,
        margin: 1.31 * SizeConfig.heightMultiplier,
      ),
    ),
    borderData: FlBorderData(show: false, border: Border.all(color: Colors.purpleAccent, width: 0.24 * SizeConfig.widthMultiplier)),
    lineBarsData: [
      LineChartBarData(
        spots: spots,
        isCurved: true,
        colors: myColors,
        barWidth: 0.71 * SizeConfig.widthMultiplier,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
          show: true,
          colors: myColors.map((color) => color.withOpacity(0.3)).toList(),
        ),
      ),
    ],
  );
}