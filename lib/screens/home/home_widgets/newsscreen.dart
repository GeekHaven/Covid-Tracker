import 'package:flutter/material.dart';
import 'package:covidtracker/config.dart';
import 'package:covidtracker/news_section/newsview.dart';

class NewsScreen extends StatelessWidget {

  var isCollapsed ;
  NewsScreen(this.isCollapsed);
  var textSpan = TextSpan(
      text: ' News\n',
      style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.green[700],
          fontSize: 1.96 * SizeConfig.textMultiplier));
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(3.27 * SizeConfig.heightMultiplier),
        ),
        child: Row(
          children: <Widget>[
              FlatButton(
                textColor: Colors.green[700],
                padding: EdgeInsets.only(
                    top: 1.1 * SizeConfig.heightMultiplier,
                    left: 4.73 * SizeConfig.widthMultiplier),
                onPressed: () {
                  if(!isCollapsed){
                    Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return NewsView(false);
                  }));
                  }
                },
                child: Center(
                  child: Card(
                    elevation: 8,
                    child: Container(
                      padding:
                          EdgeInsets.all(0.85 * SizeConfig.heightMultiplier),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Corona ",
                            style: TextStyle(
                                fontSize: 2.4 * SizeConfig.textMultiplier,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "News ",
                            style: TextStyle(
                                fontSize: 2.4 * SizeConfig.textMultiplier,
                                fontWeight: FontWeight.bold,
                                color: Colors.green[700]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            Expanded(
              flex: 1,
              child: SizedBox(
                width: 60 * SizeConfig.widthMultiplier,
                child: Image.asset('assets/images/news.png'),
              ),
            ),
          ],
        ));
  }
}
