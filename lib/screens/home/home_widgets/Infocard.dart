import 'package:auto_size_text/auto_size_text.dart';
//import 'package:covidtracker/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
//import '../indiascreen/chart.dart';
//import 'package:covidtracker/constants.dart';
//import 'package:flutter/material.dart';
//import 'package:auto_size_text/auto_size_text.dart';

class Infocard extends StatelessWidget {
  final String title;
  final String effectedNum;
  final Color color;
  final increase;
  final String iconcolor;
  final chartData;
  final stringplace;

  const Infocard(
      {Key key,
      this.title,
      this.effectedNum,
      this.iconcolor,
      this.increase,
      this.color,
      this.chartData,
      this.stringplace})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      child: GestureDetector(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 5),
                child: Column(
                  children: <Widget>[
                    SvgPicture.asset(
                      'assets/images/$iconcolor.svg',
                      fit: BoxFit.contain,
                      height: (MediaQuery.of(context).size.height -
                              MediaQuery.of(context).padding.top) *
                          0.04,
                    ),
                    SizedBox(
                      height: (MediaQuery.of(context).size.height -
                              MediaQuery.of(context).padding.top) *
                          0.002,
                    )
                  ],
                ),
              ),
              SizedBox(
                width: (MediaQuery.of(context).size.width -
                        MediaQuery.of(context).padding.top) *
                    0.03,
              ),
              FittedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FittedBox(
                      child: AutoSizeText(
                        title,
                        style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.green[700]),
                      ),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.007),
                    FittedBox(
                      child: AutoSizeText(
                        effectedNum,
                        style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    SizedBox(
                        height: (MediaQuery.of(context).size.height -
                                MediaQuery.of(context).padding.top) *
                            0.003),
                    Row(
                      children: <Widget>[
                        
                        (color!=Colors.grey)?AutoSizeText(
                          "[+$increase]",
                          style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: color),
                        ):AutoSizeText(
                          "",
                          style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: color),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        onTap: () {
          chartData(stringplace, color.withOpacity(0.7));
        },
      ),
    );
  }
}
