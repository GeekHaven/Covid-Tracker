import 'package:flutter/material.dart';
import './constants.dart';
import './screens/home/home.dart';
import './know_about/startpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CovidTracker',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBackgroundColor,
        primarySwatch: Colors.blue,
        textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
 
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
     routes: {
       StartPage.routeName: (ctx) => StartPage(),
     },
     home: new MenuDashboardPage(),
    );
  }
}

