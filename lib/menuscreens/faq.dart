import 'package:covidtracker/config.dart';
import 'package:covidtracker/menuscreens/datasource.dart';
import 'package:flutter/material.dart';

class Faqpage extends StatefulWidget {
  var constraints;
  var orientation;
  var isCollapsed;

  Faqpage(this.constraints, this.orientation, this.isCollapsed);

  @override
  _FaqpageState createState() => _FaqpageState();
}

class _FaqpageState extends State<Faqpage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
                child: Icon(
                  Icons.arrow_back,
                ),
                onTap: () {
                  SizeConfig().init(constraints, orientation, !isCollapsed);
                  Navigator.pop(context);
                }),
            Text("  FAQ",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 2.61 * SizeConfig.textMultiplier)),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: WillPopScope(
        onWillPop: () {
          SizeConfig().init(constraints, orientation, !isCollapsed);
          Navigator.pop(context);
        },
        child: ListView.builder(
            itemCount: DataSource.questionAnswers.length,
            itemBuilder: (context, index) {
              return Container(
                  child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              1.1 * SizeConfig.heightMultiplier)),
                      elevation: 8,
                      child: Container(
                        child: ExpansionTile(
                          title: Text(
                            DataSource.questionAnswers[index]["question"],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 1.96 * SizeConfig.textMultiplier),
                          ),
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.all(
                                    0.85 * SizeConfig.heightMultiplier),
                                child: Container(
                                    padding: EdgeInsets.all(
                                        0.85 * SizeConfig.heightMultiplier),
                                    child: Text(
                                      DataSource.questionAnswers[index]
                                          ["answer"],
                                      style: TextStyle(fontSize: 20),
                                    )))
                          ],
                        ),
                      )));
            }),
      ),
    );
  }
}
