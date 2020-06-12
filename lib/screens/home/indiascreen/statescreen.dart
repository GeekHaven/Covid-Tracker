import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../indiascreen/chart.dart';
import '../indiascreen/showdistrictdata.dart';
import '../home_widgets/infoCardset.dart';

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
        //print(i);
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
      //print(i);

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
      //print(spots[0]);
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
              width: 195,
              margin: EdgeInsets.only(top: 20),
              alignment: Alignment.center,
              color: index % 2 == 1 ? Colors.white : Colors.grey[100],
              child: Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 10),
                    FittedBox(
                      child: Text(
                        filteredData[index]['district'].toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 18,
                          letterSpacing: .5,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return ShowDistrictData(
                        districtData: filteredData, index: index);
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
          margin: EdgeInsets.fromLTRB(10, 35, 10, 25),
          child: ListView(children: <Widget>[
            Center(
                child: Infoset(
                    countryData: myData['statewise'][myIndex],
                    code: 2,
                    chartData: chartData)),
            SizedBox(height: ( MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top ) * 0.005),
            Text(
              "Last updated on $asofDate ",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Lato',
                color: Colors.purple,
                fontSize: 15,
              ),
            ),
            SizedBox(height: ( MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top ) * 0.02),
            Chart(mySpots: spots, chartColor: colors),
            SizedBox(height: ( MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top ) * 0.01),
            Text(
              "*Last 31 days",
              textAlign: TextAlign.right,
              style: TextStyle(
                fontFamily: 'Lato',
                color: Colors.purple,
                fontSize: 15,
              ),
            ),
            SizedBox(height: ( MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top ) * 0.03),
            ExpansionTile(
              title: Text(
                'Districts',
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  //color: Colors.white70,
                  letterSpacing: .5,
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
