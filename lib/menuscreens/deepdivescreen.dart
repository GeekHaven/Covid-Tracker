import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';



class DeepDivePage extends StatefulWidget {
  @override
  _DeepDivePageState createState() => _DeepDivePageState();
}

class _DeepDivePageState extends State<DeepDivePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SafeArea(
            child: Scaffold(
            appBar: AppBar(
            backgroundColor: Colors.purple,  
            title:Text("COVID-19 Tracker", style:TextStyle(fontWeight:FontWeight.bold))
            ),
            body: Container(
              height:double.infinity,
              width:double.infinity,
              child:WebView(
                javascriptMode: JavascriptMode.unrestricted,
                initialUrl:'https://www.covid19india.org/'
              )
            ),
            ),
        )
    );
  }
}