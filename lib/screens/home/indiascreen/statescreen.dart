import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../indiascreen/chart.dart';
import '../indiascreen/showdistrictdata.dart';
import '../home_widgets/infoCardset.dart';
import 'package:covidtracker/config.dart';

class StateScreen extends StatefulWidget {
  var data;
  var districtData;
  var dailyData;
  var stateName;
  var index;
  StateScreen(
      {this.data,
      this.districtData,
      this.dailyData,
      this.stateName,
      this.index});

  @override
  _StateScreenState createState() => _StateScreenState();
}

class _StateScreenState extends State<StateScreen> {
  var myData;
  var myDistrictData;
  var myDailyData;
  String myStateName;
  String myStateCode;
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

  void initState() {
    super.initState();
    setState(() {
      myData = widget.data;
      myDistrictData = widget.districtData;
      myDailyData = widget.dailyData;
      myStateName = widget.stateName;
      myIndex = widget.index;
    });
    asofDate = myData['statewise'][myIndex]['lastupdatedtime'];
    counter(myDistrictData);
    filteredDataCounter();
    buildDistrictList();
    chartData("Confirmed", Color(0xFF007AFE).withOpacity(0.7));
  }

  void counter(myDistrictData) {
    for (items in myDistrictData) {
      setState(() {
        count++;
      });
    }
    for (var i = 0; i < count; i++) {
      if (myDistrictData[i]['state'] == myStateName) {
        setState(() {
          myStateCode = myDistrictData[i]['statecode'];
          myStateCode = myStateCode.toLowerCase();
          filteredData = myDistrictData[i]['districtData'];
        });
      }
    }
  }

  void chartData(String detail, Color color) {
    setState(() {
      spots = [];
      colors = [];
      colors.add(color);
      int i = 0;
      for (items in myDailyData['states_daily']) {
        if (myDailyData['states_daily'][i]['status'] == detail) {
          double first = i.toDouble();
          double second;
          if (myDailyData['states_daily'][i][myStateCode] == '') {
            second = 0;
          } else {
            second = double.parse(myDailyData['states_daily'][i][myStateCode]);
          }
          spots.add(FlSpot(first, second));
        }
        i++;
      }
      while (spots.length > 31) {
        spots.removeAt(0);
      }
    });
  }

  void activeChartData(Color color) {
    setState(() {
      spots = [];
      colors = [];
      colors.add(color);
      int i = 0;
      int j = 0;
      for (items in myDailyData['states_daily']) {
        if (myDailyData['states_daily'][i]['status'] == 'Confirmed' &&
            myDailyData['states_daily'][i + 1]['status'] == 'Recovered' &&
            myDailyData['states_daily'][i + 2]['status'] == 'Deceased') {
          double confirmed;
          double recovered =
              double.parse(myDailyData['states_daily'][i + 1][myStateCode]);
          double deaths =
              double.parse(myDailyData['states_daily'][i + 2][myStateCode]);

          if (myDailyData['states_daily'][i][myStateCode] == '') {
            confirmed = 0;
          } else {
            confirmed =
                double.parse(myDailyData['states_daily'][i][myStateCode]);
          }
          double first = j.toDouble();
          double second = confirmed - recovered - deaths;
          spots.add(FlSpot(first, second));
        }
        i++;
        j++;
      }
      while (spots.length > 31) {
        spots.removeAt(0);
      }
    });
  }

  void filteredDataCounter() {
    for (items in filteredData) {
      setState(() {
        filterCounter++;
      });
    }
  }

  void buildDistrictList() {
    for (var index = 0; index < filterCounter; index++) {
      setState(() {
        districtsList.add(
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(top: 2.2 * SizeConfig.heightMultiplier),
              alignment: Alignment.center,
              color: index % 2 == 1 ? Colors.white : Colors.grey[100],
              child: Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 1 * SizeConfig.heightMultiplier),
                    FittedBox(
                      child: Text(
                        filteredData[index]['district'].toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 1.96 * SizeConfig.textMultiplier,
                          letterSpacing: 0.16 * SizeConfig.widthMultiplier,
                        ),
                      ),
                    ),
                    SizedBox(height: 1.1 * SizeConfig.heightMultiplier),
                  ],
                ),
              ),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return ShowDistrictData(
                        pieData: filteredData, index: index);
                  },
                ),
              );
            },
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(myStateName),
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.fromLTRB(
              2.36 * SizeConfig.widthMultiplier,
              3.81 * SizeConfig.heightMultiplier,
              2.36 * SizeConfig.widthMultiplier,
              2.72 * SizeConfig.heightMultiplier),
          child: ListView(children: <Widget>[
            Center(
                child: Infoset(
              countryData: myData['statewise'][myIndex],
              code: 2,
              chartData: chartData,
              activeChartData: activeChartData,
            )),
            SizedBox(height: 2 * SizeConfig.heightMultiplier),
            Text(
              "Last updated on $asofDate ",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Lato',
                color: Colors.black,
                fontSize: 1.8 * SizeConfig.textMultiplier,
              ),
            ),
            SizedBox(height: 2 * SizeConfig.heightMultiplier),
            Chart(mySpots: spots, chartColor: colors),
            SizedBox(height: 2 * SizeConfig.heightMultiplier),
            Text(
              "*Last 31 days",
              textAlign: TextAlign.right,
              style: TextStyle(
                fontFamily: 'Lato',
                color: Colors.black,
                fontSize: 1.8 * SizeConfig.heightMultiplier,
              ),
            ),
            SizedBox(height: 3 * SizeConfig.textMultiplier),
            ExpansionTile(
              title: Text(
                'Districts',
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 4 * SizeConfig.textMultiplier,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.16 * SizeConfig.heightMultiplier,
                  
                ),
              ),
              initiallyExpanded: false,
              children: [
                Column(
                  children: <Widget>[
                    ListView(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      children: districtsList,
                    )
                  ],
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
