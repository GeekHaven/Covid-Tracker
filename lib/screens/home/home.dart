import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './home_widgets/awarness.dart';
import './home_widgets/infoCardset.dart';
import './home_widgets/countryWorld.dart';
import './home_widgets/bottom.dart';
import 'package:covidtracker/menuscreens/deepdivescreen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:covidtracker/menuscreens/developer.dart';
import 'package:covidtracker/menuscreens/faq.dart';
import 'package:covidtracker/constants.dart';

class MenuDashboardPage extends StatefulWidget {
  final data;
  final districtData;
  final dailyData;
  final countrydata;
  final globalData;

  MenuDashboardPage(
      {this.data, this.districtData, this.dailyData, this.countrydata,this.globalData});
  @override
  _MenuDashboardPageState createState() => _MenuDashboardPageState();
}

class _MenuDashboardPageState extends State<MenuDashboardPage>
    with SingleTickerProviderStateMixin {
  var myData;
  var myDistrictData;
  var myDailyData;
  var myCountryData;
   var myGlobalData;
  bool status = false;
  int count = 0;

  void updateUI(data, districtData, dailyData, countrydata,globalData) async {
    setState(() {
      myData = data;
      myDistrictData = districtData;
      myDailyData = dailyData;
      myCountryData = countrydata;
      myGlobalData= globalData;
    });
  }

  bool isCollapsed = true;
  double screenWidth, screenHeight;
  bool _showchart = false;
  final Duration duration = const Duration(milliseconds: 300);
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _menuscaleAnimation;
  Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    updateUI(
        widget.data, widget.districtData, widget.dailyData, widget.countrydata,widget.globalData);
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    _menuscaleAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;

    return Scaffold(
      body: Stack(children: <Widget>[
        menu(context),
        dashboard(context),
      ]),
    );
  }

  Widget menu(context) {
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _menuscaleAnimation,
        child: Container(
            decoration: BoxDecoration(
                  gradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [ Colors.teal[300],Colors.green[900]])
                ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: (MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top) *
                    0.13,
              ),
              Container(
              
              //  color: Colors.blueGrey[600],
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "     COVID-19",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top) *
                    0.01,
              ),
              Container(
               // color: Colors.blueGrey[600],
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "        Stay Home.. Stay Safe..",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top) *
                    0.16,
              ),
              Container(
               // color: Colors.blueGrey[600],
                child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              FlatButton(
                                  //color: Colors.blueGrey[600],
                                  disabledColor: Colors.white,
                                  textColor: Colors.white,
                                  padding: EdgeInsets.all(7),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Icon(Icons.home, color: Colors.white),
                                      Text("    "),
                                      Text("Home",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return MenuDashboardPage(
                                              data: myData,
                                              districtData: myDistrictData,
                                              dailyData: myDailyData,
                                              countrydata: myCountryData,
                                              );
                                        },
                                      ),
                                    );
                                  }),
                              FlatButton(
                                 // color: Colors.blueGrey[600],
                                  disabledColor: Colors.white,
                                  textColor: Colors.white,
                                  padding: EdgeInsets.all(7),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Icon(Icons.info, color: Colors.white),
                                      Text("    "),
                                      Text("Deep Dive",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return DeepDivePage();
                                        },
                                      ),
                                    );
                                  }),
                              FlatButton(
                                 // color: Colors.blueGrey[600],
                                  disabledColor: Colors.white,
                                  textColor: Colors.white,
                                  padding: EdgeInsets.all(7),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Icon(Icons.question_answer,
                                          color: Colors.white),
                                      Text("    "),
                                      Text("FAQs",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return Faqpage();
                                        },
                                      ),
                                    );
                                  }),
                              FlatButton(
                                 // color: Colors.blueGrey[600],
                                  disabledColor: Colors.white,
                                  textColor: Colors.white,
                                  padding: EdgeInsets.all(7),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Icon(Icons.payment, color: Colors.white),
                                      Text("    "),
                                      Text("Donate",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  onPressed: () {
                                    launch("https://www.pmcares.gov.in/en/");
                                  }),
                              FlatButton(
                                 // color: Colors.blueGrey[600],
                                  disabledColor: Colors.white,
                                  textColor: Colors.white,
                                  padding: EdgeInsets.all(7),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Icon(Icons.group, color: Colors.white),
                                      Text("    "),
                                      Text("Developers",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return Developer();
                                        },
                                      ),
                                    );
                                  }),
                            ]))),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget dashboard(context) {
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: isCollapsed ? 0 : 0.6 * screenWidth,
      right: isCollapsed ? 0 : -0.2 * screenWidth,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          animationDuration: duration,
          child: Scaffold(
            body: SafeArea(
              child: Container(
                margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          InkWell(
                              child: Icon(Icons.menu, color: kPrimaryColor),
                              onTap: () {
                                setState(() {
                                  if (isCollapsed)
                                    _controller.forward();
                                  else
                                    _controller.reverse();
                                  isCollapsed = !isCollapsed;
                                });
                              }),
                          InkWell(
                              child: Icon(Icons.favorite, color: kPrimaryColor),
                              onTap: () {}),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 0,
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  _showchart
                                      ? Text(
                                          "  INDIA",
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold),
                                        )
                                      : Text(
                                          '  GLOBAL',
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold),
                                        ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.25),
                                  Switch.adaptive(
                                      value: _showchart,
                                      onChanged: (val) {
                                        setState(() {
                                          _showchart = val;
                                        });
                                      })
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                   Expanded(
                      flex: 5,
                      child: Center(
                          child: _showchart?Infoset(
                        indiaData: myData['statewise'][0],
                        code: 1,
                      ):Center(
                          child: Infoset(
                        worldData: myGlobalData,
                        code: 4,
                      )),)
                    // 
                    ),
                    //: Expanded(
                    //   flex: 5,
                    //   child: Center(
                    //       child: Infoset(
                    //     worldData: myGlobalData,
                    //     code: 1,
                    //   )),
                    // ),
                    Expanded(
                      flex: 4,
                      child: Awarenesscard(),
                    ),
                    Expanded(
                      flex: 4,
                      child: CountryWorld(
                          // myData: myData,
                          // myDistrictData: myDistrictData,
                          // myDailydata: myDailyData,
                          // myCountryData: myCountryData
                          ),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: BottomBar(

                          myData: myData,
                          myDistrictData: myDistrictData,
                          myDailydata: myDailyData,
                          myCountryData: myCountryData
            ),
          ),
        ),
      ),
    );
  }
}
