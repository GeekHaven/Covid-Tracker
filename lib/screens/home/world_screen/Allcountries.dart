// import 'dart:convert';
// import 'package:covidtracker/screens/combinedscreen.dart';
// import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// import 'package:covidtracker/constants.dart';
// import './country.dart';
//import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:covidtracker/constants.dart';
import './country.dart';
//import 'package:http/http.dart' as http;




class Allcountries extends StatelessWidget {
  final myCountrydata;
  Allcountries(this.myCountrydata);
  @override
  Widget build(BuildContext context) {
    return Container(
     // child: CombinedScreen(datalist:myCountrydata,text:'country'),
    );
  }
}