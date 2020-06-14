import 'package:covidtracker/config.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Developer extends StatefulWidget {
  @override
  _DeveloperState createState() => _DeveloperState();
}

class _DeveloperState extends State<Developer> {
  final List<List<String>> products = [
    [
      "assets/images/ravi.jpg",
      "Raviteja Kampati",
      "https://www.linkedin.com/in/raviteja-kampati-64b086172/",
      "https://twitter.com/KampatiRaviteja",
      "https://www.facebook.com/raviteja.kampati",
      " Flutter developer"
    ],
    [
      "assets/images/rohithmone.jpg",
      "Rohith Mone ",
      "https://www.linkedin.com/in/rohith-mone-b3547a196/",
      "https://twitter.com/rohith_mone",
      "https://www.facebook.com/rohith.mone",
      " Flutter developer"
    ],
    [
      "assets/images/sivasai.jpg",
      "Siva Sai Ojam",
      "https://www.linkedin.com/in/siva-sai-reddy-ojam-66a261194/",
      "https://twitter.com/SivasaireddyO",
      "https://www.facebook.com/ojamsiva.sai.1",
      " Flutter developer"
    ],
  ];
  int currentIndex = 0;
  void _next() {
    setState(() {
      if (currentIndex < products.length - 1) {
        currentIndex++;
      } else {
        currentIndex = currentIndex;
      }
    });
  }

  void _prev() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex--;
      } else {
        currentIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          GestureDetector(
            onHorizontalDragEnd: (DragEndDetails details) {
              if (details.velocity.pixelsPerSecond.dx > 0) {
                _prev();
              } else if (details.velocity.pixelsPerSecond.dx < 0) {
                _next();
              }
            },
            child: Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(products[currentIndex][0]),
                        fit: BoxFit.cover)),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                          width: 21.27 * SizeConfig.widthMultiplier,
                          margin: EdgeInsets.only(
                              bottom: 5.45 * SizeConfig.heightMultiplier),
                          child: Row(
                            children: _buildIndicator(),
                          ))
                    ]),
              ),
            ),
          ),
          Expanded(
            //child: Transform.translate(
            //offset: Offset(0,-40),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(3.27 * SizeConfig.heightMultiplier),
              decoration: BoxDecoration(
                color: Colors.grey[350],
              ),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(products[currentIndex][1],
                        style: TextStyle(
                          fontSize: 3.27 * SizeConfig.heightMultiplier,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontStyle: FontStyle.normal,
                        )),
                    SizedBox(
                      height: 0.76 * SizeConfig.heightMultiplier,
                    ),
                    Text(products[currentIndex][5]),
                    SizedBox(
                      height: 1.6 * SizeConfig.heightMultiplier,
                    ),
                    FlatButton(
                      padding:
                          EdgeInsets.all(0.55 * SizeConfig.heightMultiplier),
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            "assets/images/linkedinicon2.jpg",
                            width: 7.1 * SizeConfig.widthMultiplier,
                            height: 3.5 * SizeConfig.heightMultiplier,
                          ),
                          Text(
                            "  Linkedin",
                            style: TextStyle(
                                fontSize: 2.39 * SizeConfig.textMultiplier,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      onPressed: () {
                        launch(products[currentIndex][2]);
                      },
                    ),
                    SizedBox(
                      height: 1.2 * SizeConfig.heightMultiplier,
                    ),
                    FlatButton(
                      padding:
                          EdgeInsets.all(0.55 * SizeConfig.heightMultiplier),
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            "assets/images/twittericon.png",
                            width: 3.27 * SizeConfig.widthMultiplier,
                            height: 3.5 * SizeConfig.heightMultiplier,
                          ),
                          Text(
                            "  Twitter",
                            style: TextStyle(
                                fontSize: 2.39 * SizeConfig.textMultiplier,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      onPressed: () {
                        launch(products[currentIndex][3]);
                      },
                    )
                  ],
                ),
              ),
            ),
          )
          //) ,
        ],
      ),
    ));
  }

  Widget _indicator(bool isActive) {
    return Expanded(
        child: Container(
            height: 0.5 * SizeConfig.heightMultiplier,
            margin: EdgeInsets.only(right: 1.18 * SizeConfig.widthMultiplier),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.45 * SizeConfig.heightMultiplier),
                color: isActive ? Colors.white : Colors.grey)));
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < products.length; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }
}
