import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:covidtracker/constants.dart';
import './country.dart';




class Allcountries extends StatefulWidget {
  final myDailyCountrydata;
  Allcountries(this.myDailyCountrydata);

  @override
  _AllcountriesState createState() => _AllcountriesState();
}

class _AllcountriesState extends State<Allcountries> {
 List countries_wise = [];

  List filteredCountries = [];

  bool isSearching = false;

  getCountryStats() async {
    var response = await Dio().get('https://corona.lmao.ninja/v2/countries');
    return response.data;
  }

  @override
  void initState() {
    getCountryStats().then((data) {
      setState(() {
        countries_wise = filteredCountries = data;
      });
    });
    super.initState();
  }

  void _filteredList(val) {
    setState(() {
      filteredCountries = countries_wise
          .where((element) =>
              element['country'].toLowerCase().contains(val.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: !isSearching
              ? Text('All Countries')
              : TextField(
                  onChanged: (val) {
                    _filteredList(val);
                  },
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      icon: Icon(Icons.search, color: Colors.white),
                      hintText: "search country here",
                      hintStyle: TextStyle(color: Colors.white)),
                ),
          backgroundColor: kPrimaryColor[300],
          elevation: 0,
          actions: <Widget>[
            isSearching
                ? IconButton(
                    icon: Icon(Icons.cancel),
                    onPressed: () {
                      setState(() {
                        this.isSearching = false;
                        filteredCountries = countries_wise;
                      });
                    })
                : IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      setState(() {
                        this.isSearching = true;
                      });
                    })
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: filteredCountries.length > 0
              ? ListView.builder(
                  itemCount: filteredCountries.length,
                  itemBuilder: (BuildContext context, index) {
                  
               
                 
                    return GestureDetector(
                      
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return Country(filteredCountries[index]['country']);
                        }));
                      },
                      child: Card(
                         
                         color: index%2==1 ?Colors.white: Colors.grey[100],
                        child: ListTile(
                          leading:  SizedBox(
                            width: 30,
                            child:Image.network(filteredCountries[index]['countryInfo']['flag']),) ,   
                          title: Text(filteredCountries[index]['country'],
                              style: TextStyle(fontSize: 18)),
                              
                        ),
                      ),
                    );
                  })
              : CircularProgressIndicator(),
          // ListView(
          //   children: <Widget>[
          //
          //   ],
          // )),
        ));
  }
}




