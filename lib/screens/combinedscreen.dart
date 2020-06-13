//import 'dart:convert';
import 'package:covidtracker/screens/home/indiascreen/statescreen.dart';
//import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:covidtracker/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import './home/indiascreen/showdistrictdata.dart';
//import '../screens/home/world_screen/country.dart';

class CombinedScreen extends StatefulWidget {
  var myData;
  var myDistrictData;
  var myDailydata;
  var myCountryData;
  var datalist;
  var text;
  CombinedScreen(
      {this.myData,
      this.myDistrictData,
      this.myDailydata,
      this.datalist,
      this.text});

  @override
  _CombinedScreenState createState() => _CombinedScreenState();
}

class _CombinedScreenState extends State<CombinedScreen> {
  var placeholder;
  List list_wise = [];
  var myDailyData;
  var noofstate;

  List filteredList = [];

  bool isSearching = false;
  var myData;
  var myDistrictData;
  var myDailydata;
  var myCountryData;

  @override
  void initState() {
    setState(() {
      myData = widget.myData;
      myDailydata = widget.myDailydata;
      myDistrictData = widget.myDistrictData;
      myCountryData = widget.myCountryData;
      placeholder = widget.text;
      list_wise = filteredList = widget.datalist;
    });
    super.initState();
  }

  void _filteredList(val) {
    setState(() {
      filteredList = list_wise
          .where((element) =>
              element[placeholder].toLowerCase().contains(val.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: !isSearching
              ? ((list_wise.length > 50)
                  ? Text('All Countries')
                  : Text('All States'))
              : TextField(
                  onChanged: (val) {
                    _filteredList(val);
                  },
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      icon: Icon(Icons.search, color: Colors.white),
                      hintText: "Search here",
                      hintStyle: TextStyle(color: Colors.white)),
                ),
          backgroundColor: kPrimaryColor,
          elevation: 0,
          actions: <Widget>[
            isSearching
                ? IconButton(
                    icon: Icon(Icons.cancel),
                    onPressed: () {
                      setState(() {
                        this.isSearching = false;
                        filteredList = list_wise;
                      });
                    })
                : IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      setState(() {
                        this.isSearching = true;
                      });
                    })
          ],
        ),
        body: Container(
            padding: EdgeInsets.all(10),
            child: filteredList.length > 0
                ? ListView.builder(
                    itemCount: filteredList.length,
                    itemBuilder: (BuildContext context, index) {
                        
                      return GestureDetector(
                        onTap: () {
                          int i = 0;
                          while (i < filteredList.length - 1) {
                            if (placeholder == "state") {
                              String stateName = filteredList[index][placeholder] 
                                  .toString();
                              if (filteredList[i]['state'] == stateName) {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return StateScreen(
                                    data: myData,
                                    districtData: myDistrictData,
                                    dailyData: myDailydata,
                                    stateName: stateName,
                                    index: index,
                                  );
                                }));
                              }
                            } 
                            else {
                              String countryName = filteredList[index][placeholder];
                                //print(countryName);
                              if (filteredList[i][placeholder] == countryName) {
                                print(filteredList[i][placeholder]);
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return ShowDistrictData(
                                    pieData: filteredList,
                                    index: index,
                                    text: "country",
                                  );
                                }));
                              }
                            }

                            i++;
                          }
                        },
                        child: Card(
                          color:
                              index % 2 == 1 ? Colors.white : Colors.grey[100],
                          child: (placeholder == "country")
                              ? ListTile(
                                  leading: SizedBox(
                                    width: 30,
                                    child: Image.network(filteredList[index]
                                        ['countryInfo']['flag']),
                                  ),
                                  title: Text(filteredList[index][placeholder],
                                      style: TextStyle(fontSize: 18)),
                                  trailing: SizedBox(
                                    width: 50,
                                    child: FittedBox(
                                        child: Row(
                                      children: <Widget>[
                                        SvgPicture.asset(
                                            "assets/images/biotech.svg"),
                                        Text(filteredList[index]["tests"]
                                            .toString()),
                                      ],
                                    )),
                                  ))
                              : ListTile(
                                  title: Text(filteredList[index][placeholder],
                                      style: TextStyle(fontSize: 18)),
                                ),
                        ),
                      );
                    })
                : Center(
                    child: FittedBox(
                    child: Column(
                      children: <Widget>[
                        Image.asset("assets/images/no_results.png"),
                        SizedBox(
                            height: (MediaQuery.of(context).size.height -
                                    MediaQuery.of(context).padding.top) *
                                0.15),
                        Text(
                          "No Results Found ",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 75,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ))));
  }
}
