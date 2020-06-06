import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dio/dio.dart';

class Apidata{
  final String url = "https://api.covid19india.org/data.json";
  final String url2 = "https://api.covid19india.org/v2/state_district_wise.json";
  final String url3 = "https://api.covid19india.org/states_daily.json";
  final String url4="https://corona.lmao.ninja/v2/countries";
  String data;
  Future getData() async{
    http.Response response = await http.get(url);
    if(response.statusCode == 200){
      data = response.body;
      return jsonDecode(data);
    }else{
      return response.statusCode;
    }
  }
  Future getDistrictData() async{
    http.Response response = await http.get(url2);
    if(response.statusCode == 200){
      data = response.body;
      return jsonDecode(data);
    }else{
      return response.statusCode;
    }
  }
    Future getDailyData() async{
    http.Response response = await http.get(url3);
    if(response.statusCode == 200){
      data = response.body;
      return jsonDecode(data);
    }else{
      return response.statusCode;
    }
  }
  //   Future getCountryData() async{
  //   http.Response response = await http.get(url4);
  //   if(response.statusCode == 200){
  //     data = response.body;
  //     return jsonDecode(data);
  //   }else{
  //     return response.statusCode;
  //   }
  // }

 Future  getCountryData() async {
    var response = await Dio().get('https://corona.lmao.ninja/v2/countries');
    return response.data;
  }

}