import 'package:covidtracker/screens/home/loadingscreen.dart';
import 'package:flutter/material.dart';
import './constants.dart';
import 'package:flutter/services.dart';
import './config.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraints, orientation);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'CovidTracker',
          theme: ThemeData(
            primaryColor: kPrimaryColor,
            scaffoldBackgroundColor: kBackgroundColor,
            primarySwatch: Colors.blue,
            textTheme:
                Theme.of(context).textTheme.apply(displayColor: kTextColor),
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: new LoadingScreen(),
        );
      });
    });
  }
}
