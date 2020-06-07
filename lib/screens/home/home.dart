import 'dart:convert';

import 'package:covidtracker/constants.dart';
//import 'package:covidtracker/menuscreens/developerScreen.dart';
import 'package:covidtracker/stats/statistics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './home_widgets/awarness.dart';
import './home_widgets/infoCardset.dart';
import './home_widgets/countryWorld.dart';
import './home_widgets/bottom.dart';


class MenuDashboardPage extends StatefulWidget {
final Statistics statistics;


  MenuDashboardPage(this.statistics);
  @override
  _MenuDashboardPageState createState() => _MenuDashboardPageState();
}

class _MenuDashboardPageState extends State<MenuDashboardPage>
    with SingleTickerProviderStateMixin {
  Statistics statistics;
  int count = 0;

  void updateUI(statistics) async {
    setState(() {
     statistics=statistics;
     print(statistics);
      
    });
  }

  bool isCollapsed = true;
  double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 300);
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _menuscaleAnimation;
  Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    updateUI(widget.statistics);
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
    ]));
  }

  Widget menu(context) {
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _menuscaleAnimation,
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
                          color: Colors.white,
                          disabledColor: Colors.white,
                          textColor: Colors.purple,
                          highlightColor: Colors.grey,
                          padding: EdgeInsets.all(7),
                          child: Text("Home",
                              style: TextStyle(
                                  color: Colors.purple,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return Container(
                                      color: Colors.white,
                                      padding: EdgeInsets.all(10),
                                      child: Text("Hello World"));
                                },
                              ),
                            );
                          }),
                      FlatButton(
                          color: Colors.white,
                          disabledColor: Colors.white,
                          textColor: Colors.purple,
                          highlightColor: Colors.grey,
                          padding: EdgeInsets.all(7),
                          child: Text("About",
                              style: TextStyle(
                                  color: Colors.purple,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return Container(
                                      color: Colors.white,
                                      padding: EdgeInsets.all(10),
                                      child: Text("Hello World"));
                                },
                              ),
                            );
                          }),
                      FlatButton(
                          color: Colors.white,
                          disabledColor: Colors.white,
                          textColor: Colors.purple,
                          highlightColor: Colors.grey,
                          padding: EdgeInsets.all(7),
                          child: Text("FAQ",
                              style: TextStyle(
                                  color: Colors.purple,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return Container(
                                      color: Colors.white,
                                      padding: EdgeInsets.all(10),
                                      child: Text("Hello World"));
                                },
                              ),
                            );
                          }),
                      FlatButton(
                          color: Colors.white,
                          disabledColor: Colors.white,
                          textColor: Colors.purple,
                          highlightColor: Colors.grey,
                          padding: EdgeInsets.all(7),
                          child: Text("Developers",
                              style: TextStyle(
                                  color: Colors.purple,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return Container(
                                      color: Colors.white,
                                      padding: EdgeInsets.all(10),
                                      child: Text("Hello World"));
                                },
                              ),
                            );
                          }),
                    ]))),
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
            //elevation:8,// this  is making the app shady
            //  borderRadius: BorderRadius.all(Radius.circular(40)),
            color: kPrimaryColor.withOpacity(0.03),
            child: Container(
              margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        InkWell(
                            child: Icon(Icons.menu, color: Colors.purple),
                            onTap: () {
                              //   setState(() {
                              //     if(isCollapsed)
                              //       _controller.forward();
                              //     else
                              //        _controller.reverse();
                              //     isCollapsed= !isCollapsed;
                              //   });
                            }),
                        InkWell(
                            child: Icon(Icons.favorite, color: Colors.purple),
                            onTap: () {
                              //   setState(() {
                              //     if(isCollapsed)
                              //       _controller.forward();
                              //     else
                              //        _controller.reverse();
                              //     isCollapsed= !isCollapsed;
                              //   });
                            }),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                     child:    Container(
                   
                    height: 10,
                    color: Colors.amber,
                  ),),
                  Expanded(
                    flex: 4,
                    
                    child: Infoset(statistics),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    flex: 3,
                    child: Awarenesscard(),
                  ),
                  Expanded(
                    flex: 2,
                    child: CountryWorld(statistics),
                  ),
                  //  Expanded(child: null),
                ],
              ),
            )
            // bottomNavigationBar: BottomBar(),
            ),
      ),
    );
  }
}
