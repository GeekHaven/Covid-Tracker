import 'package:flutter/material.dart';
import './Infocard.dart';
import 'package:covidtracker/config.dart';

class Infoset extends StatefulWidget {
  final indiaData;
  final districtData;
  final worldData;
  final countryData;
  final code;
  final chartData;
  final activeChartData;

  Infoset(
      {this.indiaData,
      this.districtData,
      this.worldData,
      this.countryData,
      this.code,
      this.chartData,
      this.activeChartData});

  @override
  _InfosetState createState() => _InfosetState();
}

class _InfosetState extends State<Infoset> {
  List infoCardData = ['', '', '', '', '', '', '', ''];
  var code;
  var indiaData;
  var countryData;
  var chartData;
  var districtData;
  var worldData;
  var activeChartData;

  @override
  void initState() {
    setState(() {
      code = widget.code;
      indiaData = widget.indiaData;
      countryData = widget.countryData;
      districtData = widget.districtData;
      chartData = widget.chartData;
      worldData = widget.worldData;
      activeChartData = widget.activeChartData;

      if (code == 1) {
        infoCardData[0] = indiaData['confirmed'];
        infoCardData[1] = indiaData['deltaconfirmed'];
        infoCardData[2] = indiaData['active'];
        infoCardData[3] = indiaData['comfirmed'];
        infoCardData[4] = indiaData['deaths'];
        infoCardData[5] = indiaData['deltadeaths'];
        infoCardData[6] = indiaData['recovered'];
        infoCardData[7] = indiaData['deltarecovered'];
      }
      if (code == 2) {
        infoCardData[0] = countryData['confirmed'];
        infoCardData[1] = countryData['deltaconfirmed'];
        infoCardData[2] = countryData['active'];
        infoCardData[3] = countryData['comfirmed'];
        infoCardData[4] = countryData['deaths'];
        infoCardData[5] = countryData['deltadeaths'];
        infoCardData[6] = countryData['recovered'];
        infoCardData[7] = countryData['deltarecovered'];
      }
      if (code == 3) {
        infoCardData[0] = (districtData['confirmed']).toString();
        infoCardData[1] = (districtData['delta']['confirmed']).toString();
        infoCardData[2] = (districtData['active']).toString().toString();
        infoCardData[3] = (districtData['comfirmed'].toString());
        infoCardData[4] = (districtData['deceased']).toString();
        infoCardData[5] = (districtData['delta']['deceased']).toString();
        infoCardData[6] = (districtData['recovered']).toString();
        infoCardData[7] = (districtData['delta']['recovered']).toString();
      }
      if (code == 4) {
        infoCardData[0] = (worldData['cases']).toString();
        infoCardData[1] = (worldData['todayCases']).toString();
        infoCardData[2] = (worldData['active']).toString().toString();
        infoCardData[3] = (worldData['active'].toString());
        infoCardData[4] = (worldData['deaths']).toString();
        infoCardData[5] = (worldData['todayDeaths']).toString();
        infoCardData[6] = (worldData['recovered']).toString();
        infoCardData[7] = (worldData['todayRecovered']).toString();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 22 * SizeConfig.heightMultiplier,
        width: double.infinity,
        padding: EdgeInsets.only(left: 4.72 * SizeConfig.widthMultiplier),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(5.45 * SizeConfig.heightMultiplier),
            bottomRight: Radius.circular(5.45 * SizeConfig.heightMultiplier),
            topLeft: Radius.circular(5.45 * SizeConfig.heightMultiplier),
            topRight: Radius.circular(5.45 * SizeConfig.heightMultiplier),
          ),
        ),
        child: (code != 2)
            ? GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 1.2 * SizeConfig.widthMultiplier,
                    crossAxisCount: 2,
                    childAspectRatio: 200/82),
                children: <Widget>[
                  Infocard(
                    title: 'Total Cases',
                    effectedNum: infoCardData[0],
                    color: Colors.blue,
                    iconcolor: "blue",
                    increase: infoCardData[1],
                  ),
                  Infocard(
                    title: 'Deaths',
                    effectedNum: infoCardData[4],
                    color: Colors.red,
                    iconcolor: "red",
                    increase: infoCardData[5],
                  ),
                  Infocard(
                    title: 'Recovered',
                    effectedNum: infoCardData[6],
                    color: Colors.green,
                    iconcolor: "green",
                    increase: infoCardData[7],
                  ),
                  Infocard(
                    title: 'Active Cases',
                    effectedNum: infoCardData[2],
                    increase: '',
                    color: Colors.yellow,
                    iconcolor: "yellow",
                    activeChartData: activeChartData,
                  ),
                ],
              )
            : GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 2.4 * SizeConfig.widthMultiplier,
                    crossAxisSpacing: 0.5 * SizeConfig.heightMultiplier,
                    crossAxisCount: 2,
                    childAspectRatio: 200 / 90),
                children: <Widget>[
                  Infocard(
                    title: 'Total Cases',
                    effectedNum: infoCardData[0],
                    color: Colors.blue,
                    iconcolor: "blue",
                    increase: infoCardData[1],
                    chartData: chartData,
                    stringplace: "Confirmed",
                  ),
                  Infocard(
                    title: 'Active Cases',
                    effectedNum: infoCardData[2],
                    increase: '',
                    color: Colors.yellow,
                    iconcolor: "yellow",
                    chartData: chartData,
                    activeChartData: activeChartData,
                  ),
                  Infocard(
                    title: 'Deaths',
                    effectedNum: infoCardData[4],
                    color: Colors.red,
                    iconcolor: "red",
                    increase: infoCardData[5],
                    chartData: chartData,
                    stringplace: "Deceased",
                  ),
                  Infocard(
                    title: 'Recovered',
                    effectedNum: infoCardData[6],
                    color: Colors.green,
                    iconcolor: "green",
                    increase: infoCardData[7],
                    chartData: chartData,
                    stringplace: 'Recovered',
                  ),
                ],
              ));
  }
}
