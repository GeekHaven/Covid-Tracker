import 'package:covidtracker/apidata.dart';
import 'package:flutter/material.dart';
// import 'network.dart';
import 'package:covidtracker/stats/statistics.dart';
import 'package:connectivity/connectivity.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../home/home.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  Apidata apidata=Apidata();
 var data;
  var districtData;
  var dailyData;
var countryData;
   void setData()async{
    
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Fluttertoast.showToast(
          msg: "This App Requires an Internet Connection. Restart the App.",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Color(0xFFEB1555),
          textColor: Colors.white,
          fontSize: 16.0
      );
      return;

    } 
data = await apidata.getData();
    districtData = await apidata.getDistrictData();
    dailyData = await apidata.getDailyData();
   countryData=await apidata.getCountryData();
   // statistics=Statistics(data:data,  districtData:districtData,dailydata: dailydata,countrydata: countrydata);
   
  
   
   if(data == int||districtData == int ){
      Fluttertoast.showToast(
          msg: "There was an error connecting to the server",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Color(0xFFEB1555),
          textColor: Colors.white,
          fontSize: 16.0
      );

     
      return;
    }

   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
      return MenuDashboardPage(data: data, districtData: districtData, dailyData: dailyData);
    }));
  }var i;
   void initState(){
     i=0;
    super.initState();
    setData();
  }
  
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xFF161625),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // RaisedButton(onPressed: ()
              // {
              //   if(statistics.data==null)
              //   return CircularProgressIndicator();

              //    print(statistics.districtData);
              //   setState(() {
              //     i++;
              //   });
               
              // }) 
            //  Text("")
              // statistics.data['cases_time_series'][0]['date']==Null?Text("awww"):Text(statistics.data['cases_time_series'][0]['date']),
            ],
          )
        )
      ),
    );
  }
}