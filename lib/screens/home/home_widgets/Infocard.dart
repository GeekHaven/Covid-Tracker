import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:covidtracker/config.dart';

class Infocard extends StatelessWidget {
  final String title;
  final String effectedNum;
  final Color color;
  final increase;
  final String iconcolor;
  final chartData;
  final stringplace;
  final activeChartData;

  const Infocard(
      {Key key,
      this.title,
      this.effectedNum,
      this.iconcolor,
      this.increase,
      this.color,
      this.chartData,
      this.stringplace,
      this.activeChartData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50 * SizeConfig.widthMultiplier,
      child: GestureDetector(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    left: 2.36 * SizeConfig.widthMultiplier,
                    top: 0.55 * SizeConfig.heightMultiplier),
                child: Column(
                  children: <Widget>[
                    SvgPicture.asset('assets/images/$iconcolor.svg',
                        fit: BoxFit.contain,
                        height: (4 * SizeConfig.heightMultiplier)),
                    SizedBox(
                      height: (2 * SizeConfig.heightMultiplier),
                    )
                  ],
                ),
              ),
              SizedBox(width: (3 * SizeConfig.widthMultiplier)),
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
                            fontSize: 1.64 * SizeConfig.textMultiplier,
                            fontWeight: FontWeight.bold,
                            color: color),
                      ),
                    ),
                    SizedBox(height: 0.7 * SizeConfig.heightMultiplier),
                    FittedBox(
                      child: AutoSizeText(
                        effectedNum,
                        style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 1.96 * SizeConfig.textMultiplier,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: (0.3 * SizeConfig.heightMultiplier),
                    ),
                    Row(
                      children: <Widget>[
                        (color != Colors.yellow)
                            ? AutoSizeText(
                                "[+$increase]",
                                style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontSize: 1.1 * SizeConfig.textMultiplier,
                                    fontWeight: FontWeight.bold,
                                    color: color),
                              )
                            : AutoSizeText(
                                "",
                                style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontSize: 1.1 * SizeConfig.textMultiplier,
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
          title != 'Active Cases'
              ? chartData(stringplace, color.withOpacity(0.7))
              : activeChartData(color.withOpacity(0.7));
        },
      ),
    );
  }
}
