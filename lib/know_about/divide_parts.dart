import 'package:covidtracker/constants.dart';
import 'package:flutter/material.dart';
import '../know_about/cardmodel.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:covidtracker/config.dart';

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
              fontSize: 3.05 * SizeConfig.heightMultiplier,
              fontWeight: FontWeight.w900,
              letterSpacing: 0.1 * SizeConfig.widthMultiplier,
            ),
          ),
          SizedBox(height: 2 * SizeConfig.heightMultiplier),
          SizedBox(
            height: 18 * SizeConfig.heightMultiplier,
            child: Carousel(
                boxFit: BoxFit.contain,
                autoplay: false,
                animationCurve: Curves.fastOutSlowIn,
                animationDuration: Duration(milliseconds: 1000),
                dotSize: 0.43 * SizeConfig.heightMultiplier,
                dotIncreasedColor: kPrimaryColor,
                dotBgColor: Colors.transparent,
                dotPosition: DotPosition.topRight,
                dotVerticalPadding: 1.1 * SizeConfig.heightMultiplier,
                showIndicator: true,
                indicatorBgPadding: 0.85 * SizeConfig.heightMultiplier,
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
