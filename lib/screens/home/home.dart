import 'dart:convert';

import 'package:covidtracker/constants.dart';
//import 'package:covidtracker/menuscreens/developerScreen.dart';
import 'package:covidtracker/stats/world.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './home_widgets/awarness.dart';
import './home_widgets/infoCardset.dart';
import './home_widgets/countryWorld.dart';
import './home_widgets/bottom.dart';
import 'package:http/http.dart' as http;



class MenuDashboardPage extends StatefulWidget{
  final  data;
  MenuDashboardPage(this.data);
  @override
  _MenuDashboardPageState createState() => _MenuDashboardPageState();
}

class _MenuDashboardPageState extends State<MenuDashboardPage> with SingleTickerProviderStateMixin {
 var myData;
   int count=0;
  String totalConfirmed = "";
  String totalActive = "";
  String totalDeath = "";
  String totalRecovered = "";
  String deltaConfirmed = "";
  String deltaDeath = "";
  String deltaRecovered = "";
 void updateUI(data)async{
    setState(() {
      myData = data;
      totalConfirmed = data['statewise'][0]['confirmed'];
      totalActive = data['statewise'][0]['active'];
      totalRecovered = data['statewise'][0]['recovered'];
      totalDeath = data['statewise'][0]['deaths'];
      deltaConfirmed = data['statewise'][0]['deltaconfirmed'];
      deltaDeath = data['statewise'][0]['deltadeaths'];
      deltaRecovered = data['statewise'][0]['deltarecovered'];
    });
  }


  bool isCollapsed=true;
  double screenWidth, screenHeight;
  final Duration duration =const Duration(milliseconds:300);
  AnimationController _controller;
  Animation <double> _scaleAnimation;
  Animation <double> _menuscaleAnimation;
  Animation <Offset> _slideAnimation;

  @override
  void initState(){
    super.initState();
     updateUI(widget.data);
    _controller=AnimationController(vsync:this, duration:duration );
    _scaleAnimation=Tween<double>(begin: 1,end: 0.8).animate(_controller);
    _menuscaleAnimation=Tween<double>(begin: 0.5,end: 1).animate(_controller);
    _slideAnimation=Tween<Offset>(begin:Offset(-1,0),end:Offset(0,0)).animate(_controller);
  }
  @override
   void dispose(){
     _controller.dispose();
    super.dispose();
  }
  @override
  Widget build (BuildContext context){
    Size size=MediaQuery.of(context).size;
    screenWidth=size.width;
    screenHeight=size.height;
       return Scaffold(
         body:Stack(
           children:<Widget>[
             menu(context),
             dashboard(context),

           ]
         )
       );

    }

   Widget menu(context){

       return SlideTransition(
          
          position:_slideAnimation,
           child: ScaleTransition(
            scale:_menuscaleAnimation,
             child: Padding (
             padding:const EdgeInsets.only(left: 16.0),
             child:Align(
             alignment:Alignment.centerLeft,
             child: Column(
               mainAxisSize: MainAxisSize.min,
               mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.start,
               children:<Widget>[

              FlatButton(
          
                color:Colors.white,
                disabledColor: Colors.white,
                textColor: Colors.purple,
                highlightColor: Colors.grey,
                padding:EdgeInsets.all(7),
                child:Text(
                "Home", 
                 style: TextStyle(
                   color:Colors.purple, fontSize:20,fontWeight: FontWeight.bold)
               ),
                  onPressed:(){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return Container(
                        color: Colors.white,
                        padding: EdgeInsets.all(10),
                        child:Text("Hello World")
                      );
                    },),);
                }
               ),

               FlatButton(
                color:Colors.white,
                disabledColor: Colors.white,
                textColor: Colors.purple,
                highlightColor: Colors.grey,
                padding:EdgeInsets.all(7),
                child:Text(
                "About", 
                 style: TextStyle(
                   color:Colors.purple,fontSize:20,fontWeight: FontWeight.bold)
               ),
                 onPressed:(){
                   Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return Container(
                         color: Colors.white,
                        padding: EdgeInsets.all(10),
                        child:Text("Hello World")
                      );
                    },),);
                    
                }
               ),

               FlatButton(
                color:Colors.white,
                disabledColor: Colors.white,
                textColor: Colors.purple,
                highlightColor: Colors.grey,
                padding:EdgeInsets.all(7),
                child:Text(
                "FAQ", 
                 style: TextStyle(
                   color:Colors.purple, fontSize:20,fontWeight: FontWeight.bold)
               ),
                onPressed:(){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return Container(
                        color: Colors.white,
                        padding: EdgeInsets.all(10),
                        child:Text("Hello World")
                      );
                    },),);
                }
               ),

                FlatButton(
                color:Colors.white,
                disabledColor: Colors.white,
                textColor: Colors.purple,
                highlightColor: Colors.grey,
                padding:EdgeInsets.all(7),
                child:Text(
                "Developers", 
                 style: TextStyle(
                   color:Colors.purple, fontSize:20,fontWeight: FontWeight.bold)
               ),
                 onPressed:(){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return Container(
                        color: Colors.white,
                        padding: EdgeInsets.all(10),
                        child:Text("Hello World")
                      );
                    },),);
                }
               ),
             ]
         )
         )
         ),
           ),
       );
   }

   Widget dashboard(context){

  Future<Wcases> worlddata;

  Future<Wcases> getWorldStats() async {
    var response = await http.get('https://corona.lmao.ninja/v2/all');
    

    if (response.statusCode == 200) {
      
      return Wcases.fromJson(json.decode(response.body));
    } else {
      throw Exception('try again');
    }
  }

  
 

  // @override
  //  void initState() {
  //   worlddata=getWorldStats();
  //   super.initState();
  // }
    return AnimatedPositioned(
          duration:duration,
          top:0,
          bottom:0,
          left:isCollapsed ? 0 : 0.6 * screenWidth,
          right:isCollapsed ? 0 : -0.2*screenWidth,
          
          child: ScaleTransition(
            scale:
            
            _scaleAnimation,
            child: Material(
            animationDuration : duration,
            elevation:8,
            borderRadius: BorderRadius.all(Radius.circular(40)),
            color: kPrimaryColor.withOpacity(0.03),

            child:Container(
              padding: const EdgeInsets.only(left:16,right:16,top:30),
            child:Column(
              children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                
                  InkWell(
                    child: Icon(Icons.menu,color:Colors.purple),
                    onTap: (){
                      setState(() {
                        if(isCollapsed)
                          _controller.forward();
                        else
                           _controller.reverse();  
                        isCollapsed= !isCollapsed;
                      });
                    }
                    ),

                  Icon(Icons.settings, color:Colors.purple)

                ],
                ),  
              Column(
              
              children: <Widget>[
              //   FutureBuilder<Wcases>(
              //   future: worlddata,
              //   builder: (context, snapshot) {
              //     if (snapshot.hasData) {
              //       return Infoset(snapshot.data);
              //     } else if (snapshot.hasError) {
              //       return Text("${snapshot.error}");
              //     }

              //     // By default, show a loading spinner.
              //     return Center(child: CircularProgressIndicator());
              //   },
              // ),
                Infoset(myData['statewise'][0]), //infocard set
                SizedBox(
                  height: 10,
                ),
                 Awarenesscard(),
                 CountryWorld(screenWidth),
              ],
            ),
            ]
            )
         
            )
        // bottomNavigationBar: BottomBar(), 
      ),
          ),
    );
  

 
}
}