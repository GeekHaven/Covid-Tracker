import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:covidtracker/news_section/newsview.dart';

class NewsScreen extends StatelessWidget {
  var textSpan = TextSpan(
      text: ' News\n',
      style: TextStyle(
          fontWeight: FontWeight.bold, color: Colors.green[700], fontSize: 18));
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: <Widget>[
            FlatButton(
              textColor: Colors.green[700],
              padding: EdgeInsets.only(top: 10, left: 20),
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
                    padding: EdgeInsets.all(8),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Corona ",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "News ",
                          style: TextStyle(
                              fontSize: 17,
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
              width: 190,
              child: SvgPicture.asset('assets/images/updates.svg'),
            ),
          ],
        ));
  }
}
