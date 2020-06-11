//import 'package:covidtracker/know_about/card_details.dart';
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
  //int _current = 0;

  void initState() {
    super.initState();
    setState(() {
      title = widget.title;
      infoList = widget.infoList;
    });
  }
 
final List<String> imgList = [
 
  "assets/images/air_by_cough_or_sneeze.png",
  "assets/images/personal_contact.png",
  "assets/images/contaminated_objects.png",
  "assets/images/crowd.png"
];
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
    
          SizedBox(
             height: 150.0,
          width: 300.0,
                      child: Carousel(
              boxFit: BoxFit.contain,
              autoplay: false,
              animationCurve: Curves.fastOutSlowIn,
              animationDuration: Duration(milliseconds: 1000),
              dotSize: 4.0,
              dotIncreasedColor: Colors.purple,
              dotBgColor: Colors.transparent,
              dotPosition: DotPosition.bottomCenter,
              dotVerticalPadding: 10.0,
              showIndicator: true,
              indicatorBgPadding: 7.0,
              images: [
                 ExactAssetImage(infoList[0].imageSource),
                  ExactAssetImage(infoList[1].imageSource),
                  ExactAssetImage(infoList[2].imageSource),
                  ExactAssetImage(infoList[3].imageSource),

  
  // ,
  // infoList[2].imageSource,
  // infoList[3].imageSource
  
]
            ),
          ),
      
      ],
    ),);
  }
}
// imageSource: infoList[_current].imageSource,
//                 title: infoList[_current].title,
//                 cardColor: infoList[_current].cardColor,
 


    