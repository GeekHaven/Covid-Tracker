import 'dart:convert';
import 'package:covidtracker/screens/combinedscreen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:covidtracker/constants.dart';
import './country.dart';




class Allcountries extends StatelessWidget {
  final myCountrydata;
  Allcountries(this.myCountrydata);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CombinedScreen(myCountrydata,'country'),
    );
  }
}