import 'package:covidtracker/constants.dart';
import 'package:flutter/material.dart';

class Infocard extends StatelessWidget {
  final String title;
  final String effectedNum;
  final Color iconcolor;

  const Infocard({
    Key key,
    this.title,
    this.effectedNum,
    this.iconcolor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          print("onTap called.");
        },
        child: Card(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(5),
                    alignment: Alignment.center,
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        color: iconcolor.withOpacity(0.3),
                        shape: BoxShape.circle),
                    child: FittedBox(child: Icon(Icons.people)),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        style: TextStyle(color: kTextColor),
                        children: [
                          TextSpan(
                            text: '$effectedNum\n',
                            style:
                                Theme.of(context).textTheme.headline6.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          TextSpan(
                            text: 'people',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          elevation: 5,
        ),
      ),
    );
  }
}
