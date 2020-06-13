import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:covidtracker/screens/home/home.dart';


class DeepDivePage extends StatefulWidget {

  var data;
  var districtData;
  var dailyData;
  var countrydata;
  var globalData;
  DeepDivePage({this.data, this.districtData, this.dailyData, this.countrydata, this.globalData});

  @override
  _DeepDivePageState createState() => _DeepDivePageState();
}

class _DeepDivePageState extends State<DeepDivePage> {
  @override

  var myData ;
  var myDistrictData ;
  var myDailyData;
  var myCountryData;
  var myGlobalData;

  void initState(){
    setState(() {
        myData = widget.data;
        myDistrictData = widget.districtData;
        myDailyData = widget.dailyData;
        myCountryData = widget.countrydata;
        myGlobalData = widget.globalData;
    });
  }
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SafeArea(
            child: Scaffold(
            appBar: AppBar(
            backgroundColor: Colors.green[700],  
            title:Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  child: Icon(Icons.arrow_back),
                  onTap:(){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context){
                              return MenuDashboardPage(data: myData,
                                              districtData: myDistrictData,
                                              dailyData: myDailyData,
                                              countrydata: myCountryData,
                                              globalData: myGlobalData,);
                                
                            },),);
                        }
                  ),
                Text("         COVID-19 Tracker", style:TextStyle(fontWeight:FontWeight.bold)),
              ],
            )
            ),
            body: Container(
              height:double.infinity,
              width:double.infinity,
              child:WebView(
                javascriptMode: JavascriptMode.unrestricted,
                initialUrl:'https://www.covid19india.org/'
              )
            ),
            ),
        )
    );
  }
}