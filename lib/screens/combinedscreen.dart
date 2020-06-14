import 'package:auto_size_text/auto_size_text.dart';
import 'package:covidtracker/screens/home/home.dart';
import 'package:covidtracker/screens/home/indiascreen/statescreen.dart';
import 'package:covidtracker/config.dart';
import 'package:flutter/material.dart';
import 'package:covidtracker/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import './home/indiascreen/showdistrictdata.dart';
import 'package:auto_size_text/auto_size_text.dart';

class CombinedScreen extends StatefulWidget {
  var myData;
  var myDistrictData;
  var myDailydata;
  var myCountryData;
  var datalist;
  var text;
  var globalData;
  CombinedScreen(
      {this.myData,
      this.myDistrictData,
      this.myDailydata,
      this.datalist,
      this.text,
      this.globalData,
      this.myCountryData});

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
  var myGlobalData;

  @override
  void initState() {
    setState(() {
      myData = widget.myData;
      myDailydata = widget.myDailydata;
      myDistrictData = widget.myDistrictData;
      myCountryData = widget.myCountryData;
      placeholder = widget.text;
      myGlobalData=widget.globalData;
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
     Route route = MaterialPageRoute(builder: (context) => MenuDashboardPage( data: myData,
          districtData: myDistrictData,
          dailyData: myDailydata,
          countrydata: myCountryData,
          globalData: myGlobalData,
          btmcode:0));
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
            padding: EdgeInsets.all(1.1 * SizeConfig.heightMultiplier),
            child: filteredList.length > 0
                ? ListView.builder(
                    itemCount: filteredList.length,
                    itemBuilder: (BuildContext context, index) {
                      return GestureDetector(
                        onTap: () {
                          int i = 0;
                          placeholder == 'state' ? i = 1 : i = 0;
                          while (i < filteredList.length) {
                            if (placeholder == "state") {
                              String stateName =
                                  filteredList[index][placeholder].toString();
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
                            } else {
                              String countryName =
                                  filteredList[index][placeholder];
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
                                    width: 7 * SizeConfig.widthMultiplier,
                                    child: Image.network(filteredList[index]
                                        ['countryInfo']['flag']),
                                  ),
                                  title: Text(filteredList[index][placeholder],
                                      style: TextStyle(
                                          fontSize: 2.35 *
                                              SizeConfig.textMultiplier)),
                                  trailing: SizedBox(
                                    width: 11.44 * SizeConfig.widthMultiplier,
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: FittedBox(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            SvgPicture.asset(
                                                "assets/images/biotech.svg" ,width: 3.5*SizeConfig.imageSizeMultiplier,),
                                            AutoSizeText(
                                              filteredList[index]
                                                      ["testsPerOneMillion"]
                                                  .toString(),
                                              
                                                   
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ))
                              : ListTile(
                                  title: Text(filteredList[index][placeholder],
                                      style: TextStyle(
                                          fontSize: 2.4*
                                              SizeConfig.textMultiplier)),
                                ),
                        ),
                      );
                    })
                : Center(
                    child: FittedBox(
                    child: Column(
                      children: <Widget>[
                        Image.asset("assets/images/404.png"),
                        SizedBox(height: 15 * SizeConfig.heightMultiplier),
                        Text(
                          "No Results Found ",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 11 * SizeConfig.textMultiplier,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ))));
  }
}
