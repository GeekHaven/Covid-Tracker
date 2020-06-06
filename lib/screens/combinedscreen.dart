import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:covidtracker/constants.dart';
import '../screens/home/world_screen/country.dart';




class CombinedScreen extends StatefulWidget {
 
  final data;
  final text;
  CombinedScreen(this.data,this.text);

  @override
  _CombinedScreenState createState() => _CombinedScreenState();
}

class _CombinedScreenState extends State<CombinedScreen> {

  var placeholder;
 List list_wise = [];

  List filteredList = [];

  bool isSearching = false;


  @override
  void initState() {
    setState(() {
        placeholder=widget.text;
        list_wise = filteredList = widget.data;
      });
    super.initState();
  }

  void _filteredList(val) {
    setState(() {
      filteredList =list_wise 
          .where((element) =>
              element[placeholder].toLowerCase().contains(val.toLowerCase()))
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
                        filteredList= list_wise;
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
          child: filteredList.length > 0
              ? ListView.builder(
                  itemCount:filteredList.length,
                  itemBuilder: (BuildContext context, index) {
                  
               
                 
                    return GestureDetector(
                      
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return Country(filteredList[index][placeholder]);
                        }));
                      },
                      child: Card(
                         
                         color: index%2==1 ?Colors.white: Colors.grey[100],
                        child: ListTile(
                          // leading:  SizedBox(
                          //   width: 30,
                          //  child:Image.network(filteredList[index]['countryInfo']['flag']),) ,   
                          title: Text(filteredList[index][placeholder],
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



