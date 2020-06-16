import 'package:flutter/material.dart';
import 'package:covidtracker/menuscreens/profilepageview.dart';
//import 'package:covidtracker/menuscreens/profile.dart';
import 'package:covidtracker/config.dart';
import 'package:url_launcher/url_launcher.dart';

class DeveloperScreen extends StatefulWidget {
  var constraints;
  var orientation;
  var isCollapsed;

  DeveloperScreen(this.constraints, this.orientation, this.isCollapsed);

  @override
  _DeveloperScreenState createState() => _DeveloperScreenState();
}

class _DeveloperScreenState extends State<DeveloperScreen>
    with SingleTickerProviderStateMixin {
  int index = 0;
  final double initialheightFactor = 0.95;
  final double finalheightFactor = 0.75;
  double screenHeight;
  Animation<double> _heightFactorAnimation;
  AnimationController _controller;
  bool isAnimationOccured = false;

  var constraints;
  var orientation;
  var isCollapsed;
  @override
  void initState() {
    constraints = widget.constraints;
    orientation = widget.orientation;
    isCollapsed = widget.isCollapsed;
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _heightFactorAnimation =
        Tween<double>(begin: 0.95, end: 0.75).animate(_controller);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  onBottomPartTap() {
    setState(() {
      if (isAnimationOccured) {
        _controller.reverse();
      } else {
        _controller.forward();
      }
      isAnimationOccured = !isAnimationOccured;
    });
  }

  Widget getWidget() {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        FractionallySizedBox(
          alignment: Alignment.topCenter,
          heightFactor: _heightFactorAnimation.value,
          child: ProfilePageView(index),
        ),
        GestureDetector(
          onTap: () {
            onBottomPartTap();
          },
          onVerticalDragUpdate: _handleVerticalUpdate,
          onVerticalDragEnd: _handleVerticalEnd,
          child: FractionallySizedBox(
            alignment: Alignment.bottomCenter,
            heightFactor: 1.15 - _heightFactorAnimation.value,
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft:
                          Radius.circular(2.18 * SizeConfig.heightMultiplier),
                      topRight:
                          Radius.circular(2.18 * SizeConfig.heightMultiplier)),
                  color: Colors.white,
                ),
                child: Container(
                    margin: EdgeInsets.all(1.63 * SizeConfig.heightMultiplier),
                    child: Wrap(
                      children: <Widget>[
                        SizedBox(height: 6.54 * SizeConfig.heightMultiplier),
                        Center(
                          child: Text("Developers",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 3.82 * SizeConfig.textMultiplier,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green[700])),
                        ),
                        SizedBox(height: 3.27 * SizeConfig.heightMultiplier),
                        Card(
                          elevation: 5,
                          child: ListTile(
                              leading: Icon(
                                Icons.account_circle,
                                color: Colors.black,
                                size: 4.36 * SizeConfig.textMultiplier,
                              ),
                              title: Text("Raviteja Kampati",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          (MediaQuery.of(context).size.height -
                                                  MediaQuery.of(context)
                                                      .padding
                                                      .top) *
                                              0.0220,
                                      fontWeight: FontWeight.bold)),
                              subtitle: Text("Flutter Developer",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize:
                                        (MediaQuery.of(context).size.height -
                                                MediaQuery.of(context)
                                                    .padding
                                                    .top) *
                                            0.02,
                                  )),
                              trailing: Wrap(spacing: 0, children: <Widget>[
                                IconButton(
                                    icon: Image.asset(
                                      "assets/images/linkedinicon2.jpg",
                                      width: 7.1 * SizeConfig.widthMultiplier,
                                      height: 3.5 * SizeConfig.heightMultiplier,
                                    ),
                                    onPressed: () {
                                      launch(
                                          "https://www.linkedin.com/in/raviteja-kampati-64b086172/");
                                    }),
                                IconButton(
                                    icon: Image.asset(
                                      "assets/images/twittericon.png",
                                      width: 7.1 * SizeConfig.widthMultiplier,
                                      height: 3.5 * SizeConfig.heightMultiplier,
                                    ),
                                    onPressed: () {
                                      launch("https://twitter.com/KampatiRaviteja");
                                    })
                              ]),
                              onTap: () {}),
                        ),
                        Card(
                          elevation: 5,
                          child: ListTile(
                              leading: Icon(Icons.account_circle,
                                  color: Colors.black,
                                  size: 4.36 * SizeConfig.textMultiplier),
                              title: Text("Rohith Mone",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          (MediaQuery.of(context).size.height -
                                                  MediaQuery.of(context)
                                                      .padding
                                                      .top) *
                                              0.0220,
                                      fontWeight: FontWeight.bold)),
                              subtitle: Text("Flutter Developer",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize:
                                        (MediaQuery.of(context).size.height -
                                                MediaQuery.of(context)
                                                    .padding
                                                    .top) *
                                            0.02,
                                  )),
                              trailing: Wrap(spacing: 0, children: <Widget>[
                                IconButton(
                                    icon: Image.asset(
                                      "assets/images/linkedinicon2.jpg",
                                      width: 7.1 * SizeConfig.widthMultiplier,
                                      height: 3.5 * SizeConfig.heightMultiplier,
                                    ),
                                    onPressed: () {
                                      launch(
                                          "https://www.linkedin.com/in/rohith-mone-b3547a196/");
                                    }),
                                IconButton(
                                    icon: Image.asset(
                                      "assets/images/twittericon.png",
                                      width: 7.1 * SizeConfig.widthMultiplier,
                                      height: 3.5 * SizeConfig.heightMultiplier,
                                    ),
                                    onPressed: () {
                                      launch("https://twitter.com/rohith_mone");
                                    })
                              ]),
                              onTap: () {}),
                        ),
                        Card(
                          elevation: 5,
                          child: ListTile(
                              leading: Icon(Icons.account_circle,
                                  color: Colors.black,
                                  size: 4.36 * SizeConfig.heightMultiplier),
                              title: Text("Siva Sai Ojam",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          (MediaQuery.of(context).size.height -
                                                  MediaQuery.of(context)
                                                      .padding
                                                      .top) *
                                              0.0220,
                                      fontWeight: FontWeight.bold)),
                              subtitle: Text("Flutter Developer",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize:
                                        (MediaQuery.of(context).size.height -
                                                MediaQuery.of(context)
                                                    .padding
                                                    .top) *
                                            0.02,
                                  )),
                              trailing: Wrap(spacing: 0, children: <Widget>[
                                IconButton(
                                    icon: Image.asset(
                                      "assets/images/linkedinicon2.jpg",
                                      width: 7.1 * SizeConfig.widthMultiplier,
                                      height: 3.5 * SizeConfig.heightMultiplier,
                                    ),
                                    onPressed: () {
                                      launch(
                                          "https://www.linkedin.com/in/siva-sai-reddy-ojam-66a261194/");
                                    }),
                                IconButton(
                                    icon: Image.asset(
                                      "assets/images/twittericon.png",
                                      width: 7.1 * SizeConfig.widthMultiplier,
                                      height: 3.5 * SizeConfig.heightMultiplier,
                                    ),
                                    onPressed: () {
                                      launch("https://twitter.com/SivasaireddyO");
                                    })
                              ]),
                              onTap: () {}),
                        ),
                      ],
                    ))),
          ),
        )
      ],
    );
  }

  _handleVerticalUpdate(DragUpdateDetails updateDetails) {
    double fractionDragged = updateDetails.primaryDelta / screenHeight;
    _controller.value = _controller.value - 5 * fractionDragged;
  }

  _handleVerticalEnd(DragEndDetails endDetails) {
    if (_controller.value >= 0.5) {
      _controller.fling(velocity: 1);
    } else {
      _controller.fling(velocity: -1);
    }
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: WillPopScope(
        onWillPop: (){
          SizeConfig().init(constraints, orientation, !isCollapsed);
          Navigator.pop(context);
        },
        child: AnimatedBuilder(
        animation: _controller,
        builder: (context, widget) {
          return getWidget();
        },
    ),
      ));
  }
}
