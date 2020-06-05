import 'package:flutter/material.dart';
import '../world_screen/Allcountries.dart';
class CountryWorld extends StatelessWidget {
   final double screenWidth;
   CountryWorld(this.screenWidth);

  Future navigateToSubPage(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => SubPage()));
}
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: screenWidth*0.4,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {
             
            },
            child: Card(
              elevation: 0,
              child: Image.asset('assets/images/india.jpg'),
            ),
          ),
          InkWell(
            onTap: () {
               
               Navigator.of(context).push(MaterialPageRoute(builder: (context){
                 return SubPage();
               }));
               
               //navigateToSubPage(context);
            },
            child: Card(
              elevation: 0,
              child: Image.asset('assets/images/world.jpg'),
            ),
          ),
        ],
      ),
    );
  }
}
