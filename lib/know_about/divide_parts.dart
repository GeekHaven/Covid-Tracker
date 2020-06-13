//import 'package:covidtracker/know_about/card_details.dart';
import 'package:covidtracker/constants.dart';
import 'package:flutter/material.dart';
import '../know_about/cardmodel.dart';
//import 'package:carousel_slider/carousel_slider.dart';
//import '../know_about/body_part.dart';
import 'package:carousel_pro/carousel_pro.dart';

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
            ),
          ),
          SizedBox(
              height: (MediaQuery.of(context).size.height -
                      MediaQuery.of(context).padding.top) *
                  0.02),
          SizedBox(
            height: (MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top) *
                0.18,

            child: Carousel(
                boxFit: BoxFit.contain,
                autoplay: false,
                animationCurve: Curves.fastOutSlowIn,
                animationDuration: Duration(milliseconds: 1000),
                dotSize: 4.0,
                dotIncreasedColor: kPrimaryColor,
                dotBgColor: Colors.transparent,
                dotPosition: DotPosition.topRight,
                dotVerticalPadding: 10.0,
                showIndicator: true,
                indicatorBgPadding: 7.0,
                images: [
                  ExactAssetImage(infoList[0].imageSource),
                  ExactAssetImage(infoList[1].imageSource),
                  ExactAssetImage(infoList[2].imageSource),
                  ExactAssetImage(infoList[3].imageSource),
                ]),
          ),
        ],
      ),
    );
  }
}
