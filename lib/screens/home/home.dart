import 'package:covidtracker/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './home_widgets/awarness.dart';
import './home_widgets/infoCardset.dart';
import './home_widgets/newsscreen.dart';
import 'package:covidtracker/menuscreens/deepdivescreen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:covidtracker/menuscreens/developer.dart';
import 'package:covidtracker/menuscreens/faq.dart';
import 'package:covidtracker/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:covidtracker/screens/home/world_screen/Allcountries.dart';
import 'package:covidtracker/screens/home/indiascreen/allstates.dart';

class MenuDashboardPage extends StatefulWidget {
  final data;
  final districtData;
  final dailyData;
  final countrydata;
  final globalData;
  int btmcode;

  MenuDashboardPage(
      {this.data,
      this.districtData,
      this.dailyData,
      this.countrydata,
      this.globalData,
      this.btmcode});
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
  int _selectedPageIndex;
  bool status = false;
  int count = 0;

  void updateUI(data, districtData, dailyData, countrydata, globalData) async {
    setState(() {
      myData = data;
      myDistrictData = districtData;
      myDailyData = dailyData;
      myCountryData = countrydata;
      myGlobalData = globalData;
      _selectedPageIndex = widget.btmcode;
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
    updateUI(widget.data, widget.districtData, widget.dailyData,
        widget.countrydata, widget.globalData);
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

    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        return Scaffold(
            body: Stack(children: <Widget>[
          menu(context, orientation, constraints),
          dashboard(context, orientation, constraints),
        ]));
      });
    });
  }

  Widget menu(context, orientation, constraints) {
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _menuscaleAnimation,
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.teal[300], Colors.green[900]])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: (MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top) *
                    0.13,
              ),
              Container(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "     COVID-19",
                    style: TextStyle(
                        fontSize: (MediaQuery.of(context).size.height -
                                MediaQuery.of(context).padding.top) *
                            0.027,
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
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "        Stay Home.. Stay Safe..",
                    style: TextStyle(
                        fontSize: (MediaQuery.of(context).size.height -
                                MediaQuery.of(context).padding.top) *
                            0.0163,
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
                child: Padding(
                    padding: EdgeInsets.only(
                        left: (MediaQuery.of(context).size.height -
                                MediaQuery.of(context).padding.top) *
                            0.04),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              FlatButton(
                                  disabledColor: Colors.white,
                                  textColor: Colors.white,
                                  padding: EdgeInsets.all(
                                      (MediaQuery.of(context).size.height -
                                              MediaQuery.of(context)
                                                  .padding
                                                  .top) *
                                          0.004),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Icon(Icons.home, color: Colors.white),
                                      Text("    "),
                                      Text("Home",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: (MediaQuery.of(context)
                                                          .size
                                                          .height -
                                                      MediaQuery.of(context)
                                                          .padding
                                                          .top) *
                                                  0.0219,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  onPressed: () {
                                    SizeConfig().init(
                                        constraints, orientation, isCollapsed);
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return MenuDashboardPage(
                                            data: myData,
                                            districtData: myDistrictData,
                                            dailyData: myDailyData,
                                            countrydata: myCountryData,
                                            globalData: myGlobalData,
                                            btmcode: 0,
                                          );
                                        },
                                      ),
                                    );
                                  }),
                              FlatButton(
                                  disabledColor: Colors.white,
                                  textColor: Colors.white,
                                  padding: EdgeInsets.all(
                                      (MediaQuery.of(context).size.height -
                                              MediaQuery.of(context)
                                                  .padding
                                                  .top) *
                                          0.004),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Icon(Icons.info, color: Colors.white),
                                      Text("    "),
                                      Text("Deep Dive",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: (MediaQuery.of(context)
                                                          .size
                                                          .height -
                                                      MediaQuery.of(context)
                                                          .padding
                                                          .top) *
                                                  0.0218,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  onPressed: () {
                                    SizeConfig().init(
                                        constraints, orientation, isCollapsed);
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return DeepDivePage(constraints,
                                              orientation, isCollapsed);
                                        },
                                      ),
                                    );
                                  }),
                              FlatButton(
                                  disabledColor: Colors.white,
                                  textColor: Colors.white,
                                  padding: EdgeInsets.all(
                                      (MediaQuery.of(context).size.height -
                                              MediaQuery.of(context)
                                                  .padding
                                                  .top) *
                                          0.004),
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
                                              fontSize: (MediaQuery.of(context)
                                                          .size
                                                          .height -
                                                      MediaQuery.of(context)
                                                          .padding
                                                          .top) *
                                                  0.0218,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  onPressed: () {
                                    SizeConfig().init(
                                        constraints, orientation, isCollapsed);
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return Faqpage(
                                              constraints, orientation, false);
                                        },
                                      ),
                                    );
                                  }),
                              FlatButton(
                                  disabledColor: Colors.white,
                                  textColor: Colors.white,
                                  padding: EdgeInsets.all(
                                      (MediaQuery.of(context).size.height -
                                              MediaQuery.of(context)
                                                  .padding
                                                  .top) *
                                          0.004),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Icon(Icons.payment, color: Colors.white),
                                      Text("    "),
                                      Text("Donate",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: (MediaQuery.of(context)
                                                          .size
                                                          .height -
                                                      MediaQuery.of(context)
                                                          .padding
                                                          .top) *
                                                  0.0218,
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
                                  padding: EdgeInsets.all(
                                      (MediaQuery.of(context).size.height -
                                              MediaQuery.of(context)
                                                  .padding
                                                  .top) *
                                          0.004),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Icon(Icons.group, color: Colors.white),
                                      Text("    "),
                                      Text("Developers",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: (MediaQuery.of(context)
                                                          .size
                                                          .height -
                                                      MediaQuery.of(context)
                                                          .padding
                                                          .top) *
                                                  0.0218,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  onPressed: () {
                                    SizeConfig().init(
                                        constraints, orientation, isCollapsed);
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return Developer(
                                              constraints, orientation, false);
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

  Widget dashboard(context, orientation, constraints) {
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
                  margin: EdgeInsets.only(
                      left: 2.36 * SizeConfig.widthMultiplier,
                      right: 2.36 * SizeConfig.widthMultiplier,
                      top: 1.1 * SizeConfig.heightMultiplier),
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
                                    SizeConfig().init(
                                        constraints, orientation, isCollapsed);
                                    if (isCollapsed)
                                      _controller.forward();
                                    else
                                      _controller.reverse();
                                    isCollapsed = !isCollapsed;
                                  });
                                }),
                            InkWell(
                                child:
                                    Icon(Icons.favorite, color: kPrimaryColor),
                                onTap: () {}),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 0,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(
                              5.2 * SizeConfig.widthMultiplier,
                              0,
                              2.36 * SizeConfig.widthMultiplier,
                              0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    _showchart
                                        ? Row(
                                            children: <Widget>[
                                              Icon(Icons.av_timer),
                                              Text(
                                                "  INDIA",
                                                style: TextStyle(
                                                    fontSize: 2.62 *
                                                        SizeConfig
                                                            .textMultiplier,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          )
                                        : Row(
                                            children: <Widget>[
                                              Icon(Icons.public),
                                              Text(
                                                '  GLOBAL',
                                                style: TextStyle(
                                                    fontSize: 2.62 *
                                                        SizeConfig
                                                            .textMultiplier,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                    SizedBox(
                                      width: 25 * SizeConfig.widthMultiplier,
                                    ),
                                    Switch.adaptive(
                                        activeColor: kPrimaryColor,
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
                            child: _showchart
                                ? Infoset(
                                    indiaData: myData['statewise'][0],
                                    code: 1,
                                  )
                                : Center(
                                    child: Infoset(
                                    worldData: myGlobalData,
                                    code: 4,
                                  )),
                          )),
                      Expanded(
                        flex: 4,
                        child: Awarenesscard(),
                      ),
                      Expanded(
                        flex: 4,
                        child: NewsScreen(!isCollapsed),
                      ),
                    ],
                  ),
                ),
              ),
              bottomNavigationBar: BottomNavigationBar(
                  backgroundColor: Colors.green[700],
                  unselectedFontSize: 1.4 * SizeConfig.textMultiplier,
                  selectedFontSize: 1.8 * SizeConfig.textMultiplier,
                  selectedItemColor: Colors.white,
                  currentIndex: widget.btmcode,
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      title: Text("Home"),
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        "assets/images/india.svg",
                        width: 4.73 * SizeConfig.widthMultiplier,
                      ),
                      title: Text(
                        "India",
                        style: TextStyle(
                            fontSize: 2.3 * SizeConfig.textMultiplier),
                      ),
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.public),
                      title: Text("Global"),
                    )
                  ],
                  onTap: (index) {
                    setState(() {
                      _selectedPageIndex = index;
                    });
                    SizeConfig().init(constraints, orientation, isCollapsed);

                    if (isCollapsed) {
                      if (index == 1) {
                        SizeConfig().init(constraints, orientation, false);
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return Allstates(
                              myData: myData,
                              myDistrictData: myDistrictData,
                              myDailydata: myDailyData);
                        }));
                      }

                      if (index == 2) {
                        SizeConfig().init(constraints, orientation, false);
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return Allcountries(myCountryData);
                        }));
                      }
                    } else {
                      SizeConfig().init(constraints, orientation, true);
                    }
                  }),
            )),
      ),
    );
  }
}
