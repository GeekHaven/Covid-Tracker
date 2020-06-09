import 'package:covidtracker/screens/home/loadingscreen.dart';
import 'package:flutter/material.dart';
import './constants.dart';
import 'package:flutter/services.dart';
//import './screens/home/home.dart';
import './know_about/startpage.dart';

void main() {
    WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
    .then((_) {
      runApp(new MyApp());
    });
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
      home: new LoadingScreen(),
    );
  }
}
