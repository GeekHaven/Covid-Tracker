import '../know_about/body_part.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../know_about/cardmodel.dart';
import '../know_about/divide_parts.dart';
//import 'dart:math' as math;

class StartPage extends StatelessWidget {
  static const routeName = '/corona-detail';

  final List<CardModel> spreadList = [
    CardModel(
        title: "Air by Cough or Sneeze",
        imageSource: "assets/images/air_by_cough_or_sneeze.png"),
    CardModel(
        title: "Personal \nContact",
        imageSource: "assets/images/personal_contact.png"),
    CardModel(
        title: "Contaminated \nObjects",
        imageSource: "assets/images/contaminated_objects.png"),
    CardModel(
      title: "Crowd \nGathering",
      imageSource: "assets/images/crowd.png",
    ),
  ];

  final List<CardModel> symptomsList = [
    CardModel(
        title: "Dry Cough",
        imageSource: "assets/images/cough1.png",
        cardColor: Colors.redAccent),
    CardModel(
        title: "High Fever",
        imageSource: "assets/images/fever1.png",
        cardColor: Colors.redAccent),
    CardModel(
        title: "Sore \nThroat",
        imageSource: "assets/images/cold1.png",
        cardColor: Colors.redAccent),
    CardModel(
        title: "Difficulty in\nBreathing",
        imageSource: "assets/images/headache1.png",
        cardColor: Colors.redAccent),
  ];

  final List<CardModel> preventList = [
    CardModel(
        title: "Wash Your Hands Often",
        imageSource: "assets/images/handwash.png",
        cardColor: Colors.greenAccent),
    CardModel(
        title: "Wear a Face Mask",
        imageSource: "assets/images/mask.png",
        cardColor: Colors.greenAccent),
    CardModel(
        title: "Avoid Contact with Sick People",
        imageSource: "assets/images/avoid_personal_contact.png",
        cardColor: Colors.greenAccent),
    CardModel(
        title: "Always Cover Your Cough or Sneeze",
        imageSource: "assets/images/cover_nose.png",
        cardColor: Colors.greenAccent),
  ];

  StartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints setconstraints) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            statusBarColor: Color(0xFF23395D),
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.light,
          ),
          child: Scaffold(
            backgroundColor: Color(0xFF23395D),
            body: SafeArea(
              child: NestedScrollView(
                  headerSliverBuilder: (BuildContext context, bool isSelected) {
                    return <Widget>[
                      SliverAppBar(
                        primary: true,
                        leading: IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                        backgroundColor: Color(0xFF23395D),
                        expandedHeight: (MediaQuery.of(context).size.height -
                                MediaQuery.of(context).padding.top) *
                            0.3,
                        floating: false,
                        snap: false,
                        pinned: false,
                        flexibleSpace: FlexibleSpaceBar(
                          background: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/corona_cardbig.png",
                                ),
                                fit: BoxFit.cover,
                                alignment: Alignment.centerRight,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 8.0, left: 20.0, top: 8.0),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Material(
                                      type: MaterialType.transparency,
                                      child: Container(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            SizedBox(
                                                height: (MediaQuery.of(context)
                                                            .size
                                                            .height -
                                                        MediaQuery.of(context)
                                                            .padding
                                                            .top) *
                                                    0.075),
                                            SizedBox(
                                                width: (MediaQuery.of(context)
                                                        .size
                                                        .width) *
                                                    0.04),
                                            Align(
                                                //alignment: Alignment.center,
                                                child: AutoSizeText(
                                              'Everything you need \nto know',
                                              style: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.9),
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              maxLines: 2,
                                            )),
                                          ],
                                        ),
                                      ),
                                    ),
                                    flex: 4,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ];
                  },
                  body: BodyPart(
                    point: 0.5,
                    child: SingleChildScrollView(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24.0),
                            topRight: Radius.circular(24.0),
                          ),
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.only(
                                    left: 20.0, right: 20.0, top: 32),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'COVID-19 (Coronavirus)',
                                      style: TextStyle(
                                        fontSize: 28.0,
                                        fontWeight: FontWeight.w900,
                                        letterSpacing: 0.4,
                                        color: Colors.black.withBlue(100),
                                      ),
                                    ),
                                    SizedBox(height: ( MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top ) * 0.01),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Icon(
                                          Icons.phone,
                                          size: 20,
                                          color: Colors.black
                                              .withBlue(200)
                                              .withOpacity(0.6),
                                        ),
                                        SizedBox(width: 7),
                                        Text(
                                          'HelpLine Number - 011-23978046',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black
                                                .withBlue(200)
                                                .withOpacity(0.6),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: ( MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top ) * 0.03),
                                    BodyPart(
                                      point: 0.5,
                                      child: Text(
                                        'Coronavirus disease (COVID-19) is an infectious disease caused by a newly discovered coronavirus.',
                                        style: TextStyle(
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black
                                              .withBlue(100)
                                              .withOpacity(0.75),
                                          height: 1.5,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: ( MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top ) * 0.025),
                                    BodyPart(
                                      point: 0.75,
                                      child: Text(
                                        'Most people who fall sick with COVID-19 will experience mild to moderate symptoms and recover without special treatment.',
                                        style: TextStyle(
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black
                                              .withBlue(100)
                                              .withOpacity(0.8),
                                          height: 1.5,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 30.0),
                                    BodyPart(
                                      point: 1,
                                      child: DivideParts(
                                        title: "Symptoms",
                                        infoList: symptomsList,
                                      ),
                                    ),
                                    SizedBox(height: ( MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top ) * 0.025),
                                    BodyPart(
                                      point: 1.5,
                                      child: DivideParts(
                                        title: "How it Spreads?",
                                        infoList: spreadList,
                                      ),
                                    ),
                                    SizedBox(height: ( MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top ) * 0.025),
                                    BodyPart(
                                      point: 2,
                                      child: DivideParts(
                                        title: "Preventions",
                                        infoList: preventList,
                                      ),
                                    ),
                                    SizedBox(height: ( MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top ) * 0.025),
                                  ],
                                ))
                          ],
                        ),
                      ),
                    ),
                  )),
            ),
          ),
        );
      },
    );
  }
}
