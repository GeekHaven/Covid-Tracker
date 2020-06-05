import 'package:covidtracker/know_about/card_details.dart';
import 'package:flutter/material.dart';
import '../know_about/cardmodel.dart';
//import '../know_about/body_part.dart';
class DivideParts extends StatelessWidget {
  final String title;
  final List<CardModel> infoList;
  const DivideParts({Key key, @required this.title, @required this.infoList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.w900,
            letterSpacing: 0.4,
            color: Colors.black.withBlue(100),
          ),
        ),
        SizedBox(height: 20),
        Row(
          children: <Widget>[
            Expanded(
              child: CardDetails(
                imageSource: infoList[0].imageSource,
                title: infoList[0].title,
                cardColor: infoList[0].cardColor,
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: CardDetails(
                imageSource: infoList[1].imageSource,
                title: infoList[1].title,
                cardColor: infoList[1].cardColor,
              ),
            ),
            SizedBox(width: 20),
          ],
        ),
        SizedBox(height: 20),
        Row(
          children: <Widget>[
            Expanded(
              child: CardDetails(
                imageSource: infoList[2].imageSource,
                title: infoList[2].title,
                cardColor: infoList[2].cardColor,
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: CardDetails(
                imageSource: infoList[3].imageSource,
                title: infoList[3].title,
                cardColor: infoList[3].cardColor,
              ),
            ),
            SizedBox(width: 20),
          ],
        ),
      ],
    );
  }
}
