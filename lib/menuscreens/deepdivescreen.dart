import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:covidtracker/config.dart';

class DeepDivePage extends StatefulWidget {
  var constraints;
  var orientation;
  var isCollapsed;

  DeepDivePage(this.constraints, this.orientation, this.isCollapsed);

  @override
  _DeepDivePageState createState() => _DeepDivePageState();
}

class _DeepDivePageState extends State<DeepDivePage> {
  @override
  var constraints;
  var orientation;
  var isCollapsed;
  @override
  void initState() {
    constraints = widget.constraints;
    orientation = widget.orientation;
    isCollapsed = widget.isCollapsed;
    super.initState();
  }

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        SizeConfig().init(constraints, orientation, !isCollapsed);
        Navigator.pop(context);
      },
      child: MaterialApp(
          home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.green[700],
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                      child: Icon(Icons.arrow_back),
                      onTap: () {
                        SizeConfig()
                            .init(constraints, orientation, !isCollapsed);
                        Navigator.pop(context);
                      }),
                  Text("  COVID-19 Tracker",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 2.61 * SizeConfig.textMultiplier)),
                ],
              )),
          body: Container(
              height: double.infinity,
              width: double.infinity,
              child: WebView(
                  javascriptMode: JavascriptMode.unrestricted,
                  initialUrl: 'https://www.covid19india.org/')),
        ),
      )),
    );
  }
}
