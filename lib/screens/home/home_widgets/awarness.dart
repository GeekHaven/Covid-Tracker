import 'package:covidtracker/know_about/startpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
//import 'package:covidtracker/constants.dart';

class Awarenesscard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var textSpan = TextSpan(
        text: ' Awareness\n',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.green[700],
            fontSize: 18));
    return Container(
      padding: EdgeInsets.all(1),
    
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: SvgPicture.asset('assets/images/doctor.svg',width: 200,),
            ),
            SizedBox(width:30),
            Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 30),
                  child: RichText(
                    text: TextSpan(
                      text: '',
                      style: Theme.of(context).textTheme.headline6.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                      children: <TextSpan>[
                        TextSpan(text: 'Spread '),
                        textSpan,
                        TextSpan(text: '      not '),
                        TextSpan(
                            text: ' Panic.',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green[700],
                                fontSize: 20)),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                    height: (MediaQuery.of(context).size.height -
                            MediaQuery.of(context).padding.top) *
                        0.0001),
                FlatButton(
                  textColor: Colors.green[700],
                  padding: EdgeInsets.only(top: 10, left: 30),
                  onPressed: () {
                    Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return StartPage();
                }));
                  },
                  child: Center(
                    child: Card(
                      elevation: 5,
                      child: Container(
                        padding: EdgeInsets.all(4),
                        child: Row(
                          children: <Widget>[
                            Text(
                              "Learn More",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 5),
                            Icon(Icons.arrow_forward),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      
    );
  }
}
