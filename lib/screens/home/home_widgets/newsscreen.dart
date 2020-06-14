import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:covidtracker/config.dart';
import 'package:covidtracker/news_section/newsview.dart';

class NewsScreen extends StatelessWidget {
  var textSpan = TextSpan(
      text: ' News\n',
      style: TextStyle(
          fontWeight: FontWeight.bold, color: Colors.green[700], fontSize: 1.96 * SizeConfig.textMultiplier));
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.27 * SizeConfig.heightMultiplier),
        ),
        child: Row(
          children: <Widget>[
            FlatButton(
              textColor: Colors.green[700],
              padding: EdgeInsets.only(top: 1.1 * SizeConfig.heightMultiplier, left: 4.73 * SizeConfig.widthMultiplier),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return NewsView(false);
                }));
              },
              child: Center(
                child: Card(
                  elevation: 8,
                  child: Container(
                    padding: EdgeInsets.all(0.85 * SizeConfig.heightMultiplier),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Corona ",
                          style: TextStyle(
                              fontSize: 2.4 * SizeConfig.textMultiplier, fontWeight: FontWeight.bold),
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
            SizedBox(
              width: 55 * SizeConfig.widthMultiplier,
              child: SvgPicture.asset('assets/images/updates.svg'),
            ),
          ],
        ));
  }
}
