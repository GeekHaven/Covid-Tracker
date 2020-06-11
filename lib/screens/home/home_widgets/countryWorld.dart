//import 'package:covidtracker/stats/indiastats.dart';
import 'package:flutter/material.dart';
import '../world_screen/Allcountries.dart';
import '../indiascreen/allstates.dart';

class CountryWorld extends StatelessWidget {
  var myData;
  var myDistrictData;
  var myDailydata;
  var myCountryData;

  CountryWorld({this.myData,this.myDistrictData,this.myDailydata,this.myCountryData});

  Future navigateToSubPage(context) async {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => Allcountries(myDailydata)));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
         //color: Colors.red,
      ),
      padding: EdgeInsets.all(13),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Allstates(myData: myData,myDistrictData: myDistrictData,myDailydata: myDailydata);
              }));

            },
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Image.asset('assets/images/india.jpg'),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Allcountries(myCountryData);
              }));
            },
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              elevation: 0,
              child: Image.asset('assets/images/world.jpg'),
            ),
          ),
        ],
      ),
    );
  }
}
