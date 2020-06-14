import 'package:covidtracker/know_about/startpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:covidtracker/config.dart';

class Awarenesscard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var textSpan = TextSpan(
        text: ' Awareness\n',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.green[700],
            fontSize: 2.18 * SizeConfig.textMultiplier));
    return Container(
      padding: EdgeInsets.all(1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            child: SvgPicture.asset(
              'assets/images/doctor.svg',
              width: 47.3 * SizeConfig.widthMultiplier,
            ),
          ),
          Column(
            children: <Widget>[
              Container(
                padding:
                    EdgeInsets.only(top: 3.27 * SizeConfig.heightMultiplier),
                child: RichText(
                  text: TextSpan(
                    text: '',
                    style: Theme.of(context).textTheme.headline6.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Spread ',
                          style: TextStyle(
                              fontSize: 2.18 * SizeConfig.textMultiplier)),
                      textSpan,
                      TextSpan(
                          text: '       not ',
                          style: TextStyle(
                              fontSize: 2.18 * SizeConfig.textMultiplier)),
                      TextSpan(
                          text: ' Panic.',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green[700],
                              fontSize: 2.18 * SizeConfig.heightMultiplier)),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 0.01 * SizeConfig.heightMultiplier),
              FlatButton(
                textColor: Colors.green[700],
                padding: EdgeInsets.only(
                  top: 2.1 * SizeConfig.heightMultiplier,
                  left: 4 * SizeConfig.widthMultiplier,
                ),
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
                      padding:
                          EdgeInsets.all(0.65 * SizeConfig.heightMultiplier),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "  Learn More ",
                            style: TextStyle(
                                fontSize: 2.2 * SizeConfig.textMultiplier,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 1.4 * SizeConfig.widthMultiplier),
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
