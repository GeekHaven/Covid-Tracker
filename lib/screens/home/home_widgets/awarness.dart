import 'package:covidtracker/know_about/startpage.dart';
import 'package:flutter/material.dart';
//import 'package:covidtracker/constants.dart';

class Awarenesscard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      //color: Colors.amber,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: <Widget>[
            Container(
              child: Image.asset('assets/images/man.png'),
            ),
            Column(
              children: <Widget>[
                Container(
                  //color: Colors.red,
                  padding: EdgeInsets.only(top: 30),
                  child: RichText(
                    text: TextSpan(
                      text: '',
                      style: Theme.of(context).textTheme.headline6.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                      children: <TextSpan>[
                        TextSpan(text: 'Spread '),
                        TextSpan(
                            text: ' Awareness\n',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.purple[300],
                                fontSize: 22)),
                        TextSpan(text: 'not '),
                        TextSpan(
                            text: ' Panic.',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.purple[300],
                                fontSize: 22)),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                FlatButton(
                  textColor: Colors.purple[300],
                  padding: EdgeInsets.only(top: 10, left: 30),
                  onPressed: () {
                    Navigator.of(context).pushNamed(StartPage.routeName);
                    /*...*/
                  },
                  child: Center(
                    child: Row(
                      // Replace with a Row for horizontal icon + text
                      children: <Widget>[
                        Text(
                          "Learn More",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 5),
                        Icon(Icons.arrow_forward),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
