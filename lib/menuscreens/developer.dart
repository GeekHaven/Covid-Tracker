import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class Developer extends StatefulWidget {
  @override
  _DeveloperState createState() => _DeveloperState();
}

class _DeveloperState extends State<Developer> {
  final List<List<String>> products=[
    [
       "assets/images/ravi.jpg",
       "Raviteja Kampati",
       "https://www.linkedin.com/in/raviteja-kampati-64b086172/",
       "https://twitter.com/KampatiRaviteja" ,
     "https://www.facebook.com/raviteja.kampati",
       "Flutter developer"
    ],
     [
       "assets/images/rohith.jpeg",
       "Rohith Mone ",
       "https://www.linkedin.com/in/rohith-mone-b3547a196/",
       
       "https://twitter.com/rohith_mone",
       
      "https://www.facebook.com/rohith.mone",
       "Flutter developer"
      
    ],
     [
       "assets/images/siva.jpeg",
       "Siva Sai Ojam",
       "https://www.linkedin.com/in/siva-sai-reddy-ojam-66a261194/",
       "https://twitter.com/SivasaireddyO",
       "https://www.facebook.com/ojamsiva.sai.1",
        "Flutter developer"
    ],
  ];
  int currentIndex=0;
  void _next(){
    setState(() {
      if(currentIndex<products.length-1){
        currentIndex++;
      }
        else{
        currentIndex=currentIndex;
      }
    });
  }
  void _prev(){
    setState(() {
      if(currentIndex>0){
        currentIndex--;
      }
        else{
        currentIndex=0;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
         width: double.infinity,
         child: Column(
           children: <Widget>[
             GestureDetector(
                onHorizontalDragEnd: (DragEndDetails details){
                  if(details.velocity.pixelsPerSecond.dx>0){
                         _prev();
                    }
                  else if(details.velocity.pixelsPerSecond.dx<0){
                       _next(); 
                  }
                },
                child: Expanded(
                  child: Container(
                   height:500,
                   width: double.infinity,
                   decoration:BoxDecoration(
                     image:DecorationImage(
                       image: AssetImage(products[currentIndex][0]),
                       fit: BoxFit.cover
                       )
                   ),
                   child: Column(
                     mainAxisAlignment:MainAxisAlignment.end,
                     children:<Widget>[
                        Container(
                          width:90,
                          margin: EdgeInsets.only(bottom:50),
                          child:Row(
                            children:
                               _buildIndicator()  
                            ,
                          )
                        )
                     ]
                   ),
               ),
                ),
             ),
             //SizedBox(width: 25,),
             Expanded(
               child: Transform.translate(
                 offset: Offset(0,-40),
                 child: Container(
                   width:double.infinity,
                   padding: EdgeInsets.all(30),
                   decoration:BoxDecoration(
                     color:Colors.white,
                     borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
                   ),
                   child: Container(
                     height: MediaQuery.of(context).size.height * 0.8,
                     child: Column(
                       
                       crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            products[currentIndex][1],
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                              ,
                              fontStyle: FontStyle.normal,
                            )
                            ),
                            SizedBox(height: 3,),
                            Text(products[currentIndex][5]),
                            SizedBox(height: 10,),
                          FlatButton(
                              padding: EdgeInsets.all(10),
                              child: Row(
                              children: <Widget>[
                                Image.asset( 
                                  "assets/images/linkedinicon.png",
                                  width: 30,
                                  height: 30,
                              ),
                              Text(
                                "  Linkedin",
                                style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                             onPressed: (){
                                launch(products[currentIndex][2]);
                              },
                          ) ,
                          SizedBox(height: 10,),
                          FlatButton(
                              padding: EdgeInsets.all(10),
                              child: Row(
                              children: <Widget>[
                                Image.asset( 
                                  "assets/images/twittericon.png",
                                  width: 30,
                                  height: 30,
                              ),
                              Text(
                                "  Twitter",
                                style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                             onPressed: (){
                                launch(products[currentIndex][3]);
                              },
                          ),
                          SizedBox(height: 10,),
                          FlatButton(
                              padding: EdgeInsets.all(10),
                              child: Row(
                              children: <Widget>[
                                Image.asset( 
                                  "assets/images/facebookicon.png",
                                  width: 30,
                                  height: 30,
                              ),
                              Text(
                                "  Facebook",
                                style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                             onPressed: (){
                                launch(products[currentIndex][4]);
                              },
                          )   
                        ],
                     ),
                   ),
                 ),
                 )
               ) ,  
         ],),
       )
    );
  }
  Widget _indicator(bool isActive)
  {
     return Expanded(
        child:Container(
          height:4,
          margin:EdgeInsets.only(right:5),
          decoration:BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color:isActive ?Colors.white :Colors.grey
          )
        )
     );
  }
List <Widget> _buildIndicator(){
    List <Widget> indicators=[];
    for(int i=0;i<products.length;i++){
      if(currentIndex==i){
        indicators.add(_indicator(true));
      }
     else{
        indicators.add(_indicator(false));
     }
    }
    return indicators;
}  
}