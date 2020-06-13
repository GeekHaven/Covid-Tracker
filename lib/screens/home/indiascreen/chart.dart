import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
//import 'package:simple_animations/simple_animations.dart';

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
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                color: Colors.white,),
            child: Padding(
              padding: const EdgeInsets.only(right: 18.0, left: 12.0, top: 24, bottom: 12),
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
        reservedSize: 22,
        textStyle: const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold, fontSize: 16),
        getTitles: (value) {
          switch (value.toInt()) {
            case 2:
              return 'MAR';
            case 5:
              return 'JUN';
            case 8:
              return 'SEP';
          }
          //print(spots.length);
          // for(var i=1; i<=spots.length; i++){
          //   if(i%7==0){
          //     print(DateTime.now().subtract(Duration(days: i)).toString());
          //     return DateTime.now().subtract(Duration(days: i)).toString();
              
          //   }
          //   else{
          //     return '';
          //   }
          //}
          return '';
        },
        margin: 8,
        
      ),
      leftTitles: SideTitles(
        showTitles: false,
        textStyle: const TextStyle(
          color: Colors.purple,
          fontWeight: FontWeight.bold,
          fontSize: 15,
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
        reservedSize: 22,
        margin: 12,
      ),
    ),
    borderData: FlBorderData(show: false, border: Border.all(color: Colors.purpleAccent, width: 1)),
    lineBarsData: [
      LineChartBarData(
        spots: spots,
        isCurved: true,
        colors: myColors,
        barWidth: 3,
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