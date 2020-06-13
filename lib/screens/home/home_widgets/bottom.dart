import 'package:covidtracker/constants.dart';
import 'package:flutter/material.dart';
import 'package:covidtracker/news_section/newsview.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../world_screen/Allcountries.dart';
import '../indiascreen/allstates.dart';

class BottomBar extends StatefulWidget {
  var myData;
  var myDistrictData;
  var myDailydata;
  var myCountryData;

  BottomBar(
      {this.myData, this.myDistrictData, this.myDailydata, this.myCountryData});
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentindex = 0;
  var myData;
  var myDistrictData;
  var myDailydata;
  var myCountryData;

  @override
  void initState() {
    // TODO: implement initState

    myCountryData = widget.myCountryData;
    myDistrictData = widget.myDistrictData;
    myDailydata = widget.myDailydata;
    myData = widget.myData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.green[700],
      unselectedFontSize: 15,
      selectedFontSize: 20,
      selectedItemColor: Colors.white,
      currentIndex: _currentindex,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            backgroundColor: Colors.purple),
        BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/images/india.svg",
              width: 20,
            ),
            title: Text("News"),
            backgroundColor: Colors.purple),
        BottomNavigationBarItem(
            icon: Icon(Icons.public),
            title: Text("News"),
            backgroundColor: Colors.purple)
      ],
      onTap: (index) {
        setState(() {
          _currentindex = index;
        });

        if (index == 1){
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return Allstates(myData: myData,myDistrictData: myDistrictData,myDailydata: myDailydata);
            }));
        }
        

        if (index == 2)
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return Allcountries(myCountryData);
          }));
      },
    );
  }
}
