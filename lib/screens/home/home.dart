import 'dart:convert';

import 'package:covidtracker/constants.dart';
import 'package:covidtracker/stats/world.dart';
import 'package:flutter/material.dart';
import './home_widgets/awarness.dart';
import './home_widgets/infoCardset.dart';
import './home_widgets/countryWorld.dart';
import './home_widgets/bottom.dart';

import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<Wcases> worlddata;

  Future<Wcases> getWorldStats() async {
    var response = await http.get('https://corona.lmao.ninja/v2/all');
    

    if (response.statusCode == 200) {
      
      return Wcases.fromJson(json.decode(response.body));
    } else {
      throw Exception('try again');
    }
  }

  @override
  void initState() {
    worlddata=getWorldStats();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Container(
        color: kPrimaryColor.withOpacity(0.03),
        child: Column(
          
          children: <Widget>[
            FutureBuilder<Wcases>(
            future: worlddata,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Infoset(snapshot.data);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
            //Infoset(), //infocard set
            SizedBox(
              height: 10,
            ),
            Awarenesscard(),
            CountryWorld(),
          ],
        ),
      ),
       bottomNavigationBar: BottomBar(),
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
