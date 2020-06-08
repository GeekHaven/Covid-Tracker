import 'package:auto_size_text/auto_size_text.dart';
import 'package:covidtracker/constants.dart';
import 'package:flutter/material.dart';


class Infocard extends StatelessWidget {
  final String title;
  final String effectedNum;
  final Color color;
  final increase;
  final String iconcolor;

  const Infocard({
    Key key,
    this.title,
    this.effectedNum,
    this.iconcolor,
    this.increase,
    this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      // margin: EdgeInsets.fromLTRB(10, 10, 5, 5),
      // decoration: BoxDecoration(
      //   color: kPrimaryColor.withOpacity(0.3),
      //   borderRadius: BorderRadius.all(Radius.circular(0)),
      // ),

      child:

//     alignment: Alignment.topCenter,

          Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 5),
              child: Column(
                children: <Widget>[
                  Image.asset(
                    'assets/images/$iconcolor.png',
                    fit: BoxFit.contain,
                    cacheHeight: 30,
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
            SizedBox(
              width: 15,
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
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: color),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.007),
                  FittedBox(
                    child: AutoSizeText(
                      effectedNum,
                      style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.003),
                  AutoSizeText(
                    "[+55]",
                    style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.7)),
                  ),
                ],
              ),
              //     child: Column(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: <Widget>[
              //     AutoSizeText(

              //         "Total Confirmed Cases",
              //         style: TextStyle(color: Colors.red, fontSize: 12),

              //     ),
              //     SizedBox(
              //       height: 5,
              //     ),
              //     Text(
              //       "5745756",
              //       style: TextStyle(color: Colors.red, fontSize: 18),
              //     ),
              //     SizedBox(
              //       height: 5,
              //     ),
              //     Text(
              //       "[+55]",
              //       style: TextStyle(color: Colors.red, fontSize: 8),
              //     ),
              //   ],
              // )
            )
          ],
        ),
      ),

      // child: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       FittedBox(
      //         child: AutoSizeText(
      //           "Confirmed",
      //           style: TextStyle(
      //               fontFamily: 'Lato',
      //               fontSize: 15,
      //               fontWeight: FontWeight.bold,
      //               color: Color(0xFFFE0739)),
      //         ),
      //       ),
      //       SizedBox(height: MediaQuery.of(context).size.height * 0.01),
      //       AutoSizeText(
      //         "[+55]",
      //         style: TextStyle(
      //             fontFamily: 'Lato',
      //             fontSize: 12,
      //             fontWeight: FontWeight.bold,
      //             color: Color(0xFFFE0739).withOpacity(0.7)),
      //       ),
      //       FittedBox(
      //         child: AutoSizeText(
      //           "5864",
      //           style: TextStyle(
      //               fontFamily: 'Lato',
      //               fontSize: 35,
      //               fontWeight: FontWeight.bold,
      //               color: Color(0xFFFE0739)),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
