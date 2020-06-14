import 'package:covidtracker/config.dart';
import 'package:covidtracker/menuscreens/datasource.dart';
import 'package:flutter/material.dart';
class Faqpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: 
      Text(
        "FAQs",
        style: TextStyle(
          fontSize: 2.61 * SizeConfig.textMultiplier,
        ),),),
      body:ListView.builder(
        itemCount: DataSource.questionAnswers.length,
        itemBuilder: (context,index){
          return  Container(
            child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1.1 * SizeConfig.heightMultiplier)),
                elevation: 8,
                child:Container(
                child: ExpansionTile( 
                title:Text(DataSource.questionAnswers[index]["question"],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 1.96 * SizeConfig.textMultiplier),),children: <Widget>[
               Padding( 
                 padding:const EdgeInsets.all(8.0),
                 child :Container(
                   padding: EdgeInsets.all(8),
                   child: Text(DataSource.questionAnswers[index]["answer"],style: TextStyle(fontSize: 20),)))
              ],),
                )
            )
          );
      }
      ),
      
    );
  }
}
