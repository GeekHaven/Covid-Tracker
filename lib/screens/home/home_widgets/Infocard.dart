import 'package:covidtracker/constants.dart';
import 'package:covidtracker/stats/statistics.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Infocard extends StatelessWidget {
  final statistics;
 
  // final String title;
  // final String effectedNum;
  // final Color iconcolor;

   Infocard(
    
    this.statistics,
  ) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
     margin: EdgeInsets.fromLTRB(10, 10, 5, 5),
        decoration: BoxDecoration(
        color: kPrimaryColor.withOpacity(0.3),
        borderRadius: BorderRadius.all(Radius.circular(0)
        
        ),
      ),
      
child: Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: <Widget>[
    Container (
      margin: EdgeInsets.fromLTRB(2, 20, 2,0),
            child: Image.asset(
    'assets/images/red.png',
   // height: MediaQuery.of(context).size.width * 0.5,
    width: MediaQuery.of(context).size.width * 0.05,
    fit: BoxFit.fitWidth,
 ),
     ),
 FittedBox(
   child :Column(
     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
     crossAxisAlignment: CrossAxisAlignment.start,
   children: <Widget>[
     
     Text(statistics.data["statewise"]["comfirmed"]),
     Text("555555"),
     Text("[+]"),
   ],
 ),
 ),
 
  ],
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
