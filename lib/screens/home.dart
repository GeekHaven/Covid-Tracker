import 'package:covidtracker/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import './widgets/Infocard.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Container(
        height: 240,
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
              crossAxisCount: 2, childAspectRatio: 300 / 180),
          children: <Widget>[
            Infocard(title:'Total Cases',effectedNum: 1079,iconcolor: Colors.orange[100],),
            Infocard(title:'Total Cases',effectedNum: 1079,iconcolor: Colors.orange[100],),
            Infocard(title:'Total Cases',effectedNum: 1089,iconcolor: Colors.orange[100],),
            Infocard(title:'Total Cases',effectedNum: 1079,iconcolor: Colors.orange[100],),
            
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

