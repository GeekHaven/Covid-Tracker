//import 'package:covidtracker/know_about/card_details.dart';
import 'package:flutter/material.dart';
import '../know_about/cardmodel.dart';
import 'package:carousel_slider/carousel_slider.dart';
//import '../know_about/body_part.dart';

class DivideParts extends StatefulWidget {
  final String title;
  final List<CardModel> infoList;
  const DivideParts({Key key, @required this.title, @required this.infoList})
      : super(key: key);

  @override
  _DividePartsState createState() => _DividePartsState();
}

class _DividePartsState extends State<DivideParts> {
  String title;
  List<CardModel> infoList = [];
  int _current = 0;

  void initState() {
    super.initState();
    setState(() {
      title = widget.title;
      infoList = widget.infoList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          widget.title,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.w900,
            letterSpacing: 0.4,
            color: Colors.black.withBlue(100),
          ),
        ),
        SizedBox(height: 20),
        CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 2.0,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            initialPage: 2,
            autoPlay: true,
            onPageChanged: (index, reason) {
              _current = index;
            },
          ),
          items: infoList.map((imgUrl) {
            Builder(builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: imgUrl.cardColor,
                ),
                child: Image.asset(imgUrl.imageSource),
              );
            });
          }).toList(), 
        )
      ],
    ));
  }
}
// imageSource: infoList[_current].imageSource,
//                 title: infoList[_current].title,
//                 cardColor: infoList[_current].cardColor,
