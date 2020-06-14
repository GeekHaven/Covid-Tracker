import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../world_screen/Allcountries.dart';
import '../indiascreen/allstates.dart';
import 'package:covidtracker/config.dart';

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
  int _selectedPageIndex = 0;
  var myData;
  var myDistrictData;
  var myDailydata;
  var myCountryData;

  @override
  void initState() {
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
      unselectedFontSize: 1.4 * SizeConfig.textMultiplier,
      selectedFontSize: 1.8 * SizeConfig.textMultiplier,
      selectedItemColor: Colors.white,
      currentIndex: _selectedPageIndex,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text("Home"),
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            "assets/images/india.svg",
            width: 4.73 * SizeConfig.widthMultiplier,
          ),
          title: Text(
            "India",
            style: TextStyle(fontSize: 2.3 * SizeConfig.textMultiplier),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.public),
          title: Text("Global"),
        )
      ],
      onTap: (index) {
        setState(() {
          _selectedPageIndex = index;
        });

        if (index == 1) {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return Allstates(
                myData: myData,
                myDistrictData: myDistrictData,
                myDailydata: myDailydata);
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
