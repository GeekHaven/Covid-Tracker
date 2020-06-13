//import 'package:covidtracker/stats/indiastats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:covidtracker/news_section/newsview.dart';

class CountryWorld extends StatelessWidget {
  // var myData;
  // var myDistrictData;
  // var myDailydata;
  // var myCountryData;

  // CountryWorld({this.myData,this.myDistrictData,this.myDailydata,this.myCountryData});

  // Future navigateToSubPage(context) async {
  //   Navigator.push(context,
  //       MaterialPageRoute(builder: (context) => Allcountries(myDailydata)));
  // }
  var textSpan = TextSpan(
      text: ' News\n',
      style: TextStyle(
          fontWeight: FontWeight.bold, color: Colors.green[700], fontSize: 18));
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          //color: Colors.red,
        ),
        // padding: EdgeInsets.all(16.1),
        child: InkWell(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              RichText(
                text: TextSpan(
                  text: '',
                  style: Theme.of(context).textTheme.headline6.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                  children: <TextSpan>[
                    TextSpan(text: 'Corona'),
                    textSpan,
                  ],
                ),
              ),
              SizedBox(
                width: 200,
                child: SvgPicture.asset('assets/images/updates.svg'),
              ),
            ],
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return NewsView(false);
            }));
          },
        )

        // child: Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //   children: [
        //     InkWell(
        //       onTap: () {
        //         Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        //           return Allstates(myData: myData,myDistrictData: myDistrictData,myDailydata: myDailydata);
        //         }));

        //       },
        //       child: Card(
        //         elevation: 0,
        //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        //         child: SvgPicture.asset('assets/images/updates.svg'),
        //       ),
        //     ),
        // InkWell(
        //   onTap: () {
        //     Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        //       return Allcountries(myCountryData);
        //     }));
        //   },
        //   child: Card(
        //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        //     elevation: 0,
        //     child: Image.asset('assets/images/world.jpg'),
        //   ),
        // ),
        // ],
        // ),
        );
  }
}
