//import 'dart:convert';

import 'package:covidtracker/constants.dart';
import 'package:flutter/material.dart';
//import 'package:auto_size_text/auto_size_text.dart';
import './Infocard.dart';

class Infoset extends StatefulWidget {
  final indiaData;
  final districtData;
  final worldData;
  final countryData;
  final code;
  final chartData;

  Infoset({this.indiaData,this.districtData,this.worldData,this.countryData,this.code,this.chartData});

  @override
  _InfosetState createState() => _InfosetState();
}

class _InfosetState extends State<Infoset> {
  List infoCardData=  ['','','','','','','',''];
  var code;
  var indiaData;
var countryData;
var chartData;
var districtData;
@override
  void initState() {
    // TODO: implement initState
setState(() {
  code=widget.code;
  indiaData=widget.indiaData;
  countryData=widget.countryData;
  districtData=widget.districtData;
  chartData=widget.chartData;
  if(code==1)
  {
    infoCardData[0]=indiaData['confirmed'];
    infoCardData[1]=indiaData['deltaconfirmed'];
    infoCardData[2]=indiaData['active'];
    infoCardData[3]=indiaData['comfirmed'];
    infoCardData[4]=indiaData['deaths'];
    infoCardData[5]=indiaData['deltadeaths'];
    infoCardData[6]=indiaData['recovered'];
    infoCardData[7]=indiaData['deltarecovered'];
  }
   if(code==2)
  {
    infoCardData[0]=countryData['confirmed'];
    infoCardData[1]=countryData['deltaconfirmed'];
    infoCardData[2]=countryData['active'];
    infoCardData[3]=countryData['comfirmed'];
    infoCardData[4]=countryData['deaths'];
    infoCardData[5]=countryData['deltadeaths'];
    infoCardData[6]=countryData['recovered'];
    infoCardData[7]=countryData['deltarecovered'];
  }
   if(code==3)
  {
    infoCardData[0]=(districtData['confirmed']).toString();
    infoCardData[1]=(districtData['delta']['confirmed']).toString();
    infoCardData[2]=(districtData['active']).toString().toString();
    infoCardData[3]=(districtData['comfirmed'].toString());
    infoCardData[4]=(districtData['deceased']).toString();
    infoCardData[5]=(districtData['delta']['deceased']).toString();
    infoCardData[6]=(districtData['recovered']).toString();
    infoCardData[7]=(districtData['delta']['recovered']).toString();
  }

});

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(10),
       height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: kPrimaryColor.withOpacity(0.03),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),

    

      child: (code!=2)?GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 200/80),
        children: <Widget>[
             Infocard(
              title: 'Total Cases',
              effectedNum: infoCardData[0],
              color: Colors.red,
              iconcolor: "red",
              increase:infoCardData[1],
              
            ),

          Infocard(
            title: 'Active Cases',
            effectedNum:infoCardData[2],
            increase: '',
            color: Colors.blue,
            iconcolor: "blue",
            
          ),
          Infocard(
            title: 'Deaths',
            effectedNum:infoCardData[4],
            color: Colors.grey,
            iconcolor: "grey",
            increase:infoCardData[5],
          ),
          Infocard(
            title: 'Recovered',
            effectedNum:infoCardData[6],
            color: Colors.green,
            iconcolor: "green",
            increase:infoCardData[7],
          ),
        ],
      ):GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 200/80),
        children: <Widget>[
             Infocard(
              title: 'Total Cases',
              effectedNum: infoCardData[0],
              color: Colors.red,
              iconcolor: "red",
              increase:infoCardData[1],
              chartData: chartData,
              stringplace: "Confirmed",
            ),

          Infocard(
            title: 'Active Cases',
            effectedNum:infoCardData[2],
            increase: '',
            color: Colors.blue,
            iconcolor: "blue",
            chartData: chartData,
            stringplace: "Active",
          ),
          Infocard(
            title: 'Deaths',
            effectedNum:infoCardData[4],
            color: Colors.grey,
            iconcolor: "grey",
            increase:infoCardData[5],
            chartData: chartData,
            stringplace: "Deceased",

          ),
          Infocard(
            title: 'Recovered',
            effectedNum:infoCardData[6],
            color: Colors.green,
            iconcolor: "green",
            increase:infoCardData[7],
            chartData: chartData,
            stringplace: 'Recovered',
          ),
        ],
      )
    );
  }   
}
