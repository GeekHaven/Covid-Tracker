import 'dart:convert';

import 'package:covidtracker/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import './widgets/Infocard.dart';

import '../stats/world.dart';
import 'package:http/http.dart'as http;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<Wcases> worlddata;

 Future<Wcases> getWorldStats() async{
  var response = await  http.get(
    Uri.encodeFull('https://corona.lmao.ninja/v2/all'),
  );

  if(response.statusCode==200)
  {
    final convertWorlddata=jsonDecode(response.body);
    return Wcases.fromJson(convertWorlddata);
  }

  else 
  {
    throw Exception('try again');
  }


 


   
}

@override
  void initState() {
    this.getWorldStats();
    super.initState();
  }
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Container(
        padding: EdgeInsets.all(10),
        height: 300,
        width: double.infinity,
        decoration: BoxDecoration(
          color: kPrimaryColor.withOpacity(0.03),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
        ),
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 300 / 220),
          children: <Widget>[
            // FutureBuilder(
            //   future: getWorldStats(),
            //   builder:(BuildContext context,Snapshot){
            //     if(Snapshot.hasData)
            //     {
            //       return 
            //     }
            //   },
            // ),
           
           Infocard(title:'Total Cases',effectedNum:'5256' ,iconcolor: Colors.orange[100],),
            Infocard(title:'Total Cases',effectedNum: '1073',iconcolor: Colors.orange[100],),
            Infocard(title:'Total Cases',effectedNum: '555',iconcolor: Colors.orange[100],),
            Infocard(title:'Total Cases',effectedNum: '546',iconcolor: Colors.orange[100],),
            
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor.withOpacity(0.03),
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          color: kPrimaryColor,
        ),
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.favorite,
            color: kPrimaryColor,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}

