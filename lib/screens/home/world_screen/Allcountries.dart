
import 'package:covidtracker/screens/combinedscreen.dart';

import 'package:flutter/material.dart';





class Allcountries extends StatelessWidget {
  final myCountrydata;
  Allcountries(this.myCountrydata);
  @override
  Widget build(BuildContext context) {
    return Container(
     child: CombinedScreen(datalist:myCountrydata,text:'country'),
    );
  }
}