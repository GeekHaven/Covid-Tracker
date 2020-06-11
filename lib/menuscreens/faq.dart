import 'package:covidtracker/menuscreens/datasource.dart';
import 'package:flutter/material.dart';
class Faqpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: 
      Text("FAQs"),),
      body:ListView.builder(
        itemCount: DataSource.questionAnswers.length,
        itemBuilder: (context,index){
          return  Container(
            //decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
            child: Card(
               
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                elevation: 8,
                child:Container(
                //decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
                child: ExpansionTile( 
                title:Text(DataSource.questionAnswers[index]["question"],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),children: <Widget>[
               Padding( 
                 padding:const EdgeInsets.all(8.0),
                 child :Container(
                  // decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
                   padding: EdgeInsets.all(8),
                   child: Text(DataSource.questionAnswers[index]["answer"],style: TextStyle(fontSize:16),)))
              ],),
                )
            )
          );
      }
      ),
      
    );
  }
}