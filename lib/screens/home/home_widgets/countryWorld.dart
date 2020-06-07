//import 'package:covidtracker/stats/indiastats.dart';
import 'package:covidtracker/stats/statistics.dart';
import 'package:flutter/material.dart';
import '../world_screen/Allcountries.dart';
import '../indiascreen/allstates.dart';

class CountryWorld extends StatelessWidget {
 final Statistics statistics;
 

  CountryWorld(this.statistics);

  Future navigateToSubPage(context) async {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => Allcountries(statistics)));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(30),
      // ),
      padding: EdgeInsets.all(10),
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Allstates(statistics);
              }));

              //navigateToSubPage(context);
            },
            child: Card(
              elevation: 0,
              child: Image.asset('assets/images/india.jpg'),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Allcountries(statistics);
              }));

              //navigateToSubPage(context);
            },
            child: Card(
              elevation: 0,
              child: Image.asset('assets/images/world.jpg'),
            ),
          ),
        ],
      ),
    );
  }
}
