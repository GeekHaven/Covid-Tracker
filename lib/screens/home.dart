import 'package:covidtracker/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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

class Infocard extends StatelessWidget {
 final String title;
 final int effectedNum;
 final Color iconcolor;
 
  const Infocard({
    Key key, this.title, this.effectedNum, this.iconcolor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(5),
                  alignment: Alignment.center,
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      color: iconcolor.withOpacity(0.3),
                      shape: BoxShape.circle),
                  child: FittedBox(child: Icon(Icons.people)),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      style: TextStyle(color: kTextColor),
                      children: [
                        TextSpan(
                          text: '$effectedNum\n',
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              .copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        TextSpan(
                          text: 'people',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        )
                      ],
                    ),
                  ),
                  
                ],
              ),
            ),
          ],
        ),
        elevation: 5,
      ),
      
    );
  }
}
