import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../indiascreen/resuable_card.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../indiascreen/chart.dart';

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
          ReusableCard(
            width: 195,
            margin: EdgeInsets.only(top: 20),
            alignment: Alignment.center,
            colour: index % 2 == 1 ? Colors.white : Colors.grey[100],
            cardChild: Center(
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
                        //fontWeight: FontWeight.bold,
                        letterSpacing: .5,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            onPress: () {},
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
          margin: EdgeInsets.fromLTRB(10, 25, 10, 25),
          child: ListView(children: <Widget>[
            //SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: ReusableCard(
                    colour: Color(0xFF007AFE).withOpacity(0.7),
                    margin: EdgeInsets.fromLTRB(2, 10, 2, 5),
                    height: MediaQuery.of(context).size.height * 0.16,
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 2),
                    cardChild: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FittedBox(
                            child: AutoSizeText("Confirmed",
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                )),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.01),
                          FittedBox(
                            child: Text(
                                "[+${myData['statewise'][myIndex]['deltaconfirmed'].toString()}]",
                                style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          ),
                          SizedBox(height: 3),
                          FittedBox(
                            child: AutoSizeText(
                                myData['statewise'][myIndex]['confirmed']
                                    .toString(),
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                )),
                          ),
                        ],
                      ),
                    ),
                    onPress: () {
                      chartData(
                          "Confirmed", Color(0xFF007AFE).withOpacity(0.7));
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ReusableCard(
                    colour: Colors.yellow,
                    height: MediaQuery.of(context).size.height * 0.16,
                    margin: EdgeInsets.fromLTRB(2, 10, 2, 5),
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 2),
                    cardChild: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FittedBox(
                            child: AutoSizeText("Active",
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                )),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.01),
                          FittedBox(
                            child: Text(" ",
                                style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          ),
                          SizedBox(height: 3),
                          FittedBox(
                            child: AutoSizeText(
                              myData['statewise'][myIndex]['active'].toString(),
                              style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    onPress: () {
                      activeChartData(Colors.yellow);
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.000005,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: ReusableCard(
                    height: MediaQuery.of(context).size.height * 0.16,
                    colour: Color(0xFF27A644).withOpacity(0.7),
                    margin: EdgeInsets.fromLTRB(2, 10, 2, 5),
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 2),
                    cardChild: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FittedBox(
                            child: AutoSizeText(
                              "Recovered",
                              style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.01),
                          FittedBox(
                            child: Text(
                              "[+${myData['statewise'][myIndex]['deltarecovered'].toString()}]",
                              style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          SizedBox(height: 3),
                          FittedBox(
                            child: AutoSizeText(
                                myData['statewise'][myIndex]['recovered']
                                    .toString(),
                                style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          ),
                        ],
                      ),
                    ),
                    onPress: () {
                      chartData("Recovered", Color(0xFF27A644));
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ReusableCard(
                      height: MediaQuery.of(context).size.height * 0.16,
                      colour: Colors.red,
                      margin: EdgeInsets.fromLTRB(2, 10, 2, 5),
                      padding: EdgeInsets.fromLTRB(5, 5, 5, 2),
                      cardChild: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FittedBox(
                              child: AutoSizeText(
                                "Deaths",
                                style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01),
                            FittedBox(
                              child: Text(
                                "[+${myData['statewise'][myIndex]['deltadeaths'].toString()}]",
                                style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            SizedBox(height: 3),
                            FittedBox(
                              child: AutoSizeText(
                                  myData['statewise'][myIndex]['deaths']
                                      .toString(),
                                  style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ),
                          ],
                        ),
                      ),
                      onPress: () {
                        chartData("Deceased", Colors.red);
                      }),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Text(
              "Last updated on $asofDate ",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Lato',
                color: Colors.purple,
                fontSize: 15,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.015),
            Chart(mySpots: spots, chartColor: colors),
            SizedBox(height: 5),
            Text(
              "Graph for Last 31 days",
              textAlign: TextAlign.right,
              style: TextStyle(
                fontFamily: 'Lato',
                color: Colors.purple,
                fontSize: 15,
              ),
            ),
            SizedBox(height: 10),
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
