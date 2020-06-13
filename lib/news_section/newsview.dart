import 'package:covidtracker/constants.dart';
import 'package:flutter/material.dart';
import './news_widget.dart';
import 'package:avatar_glow/avatar_glow.dart';
import './newsdata.dart';
//import 'package:flutter_spinkit/flutter_spinkit.dart';

class NewsView extends StatefulWidget {
  var code;
  NewsView(this.code);
  @override
  _NewsViewState createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  bool _loading;
  var newslist;

  bool _showchart = false;

  void getNews() async {
    var news = IndiaNews();
    await news.getIndiaNews(_showchart);
    newslist = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    _loading = true;
    _showchart = widget.code;
    // TODO: implement initState
    super.initState();

    getNews();
  }

  @override
  Widget build(BuildContext context) {
    Route route = MaterialPageRoute(builder: (context) => NewsView(_showchart));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Corona",
              style:
                  TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
            ),
            Text(
              " News",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
            SizedBox(width: 50),
          ],
        ),
      ),
      body: SafeArea(
        child: _loading
            ? Center(
                child: AvatarGlow(
                  glowColor: Colors.green,
                  endRadius: 90.0,
                  duration: Duration(milliseconds: 2000),
                  repeat: true,
                  showTwoGlows: true,
                  repeatPauseDuration: Duration(milliseconds: 100),
                  child: Material(
                    elevation: 8.0,
                    shape: CircleBorder(),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[100],
                      child: Image.asset(
                        'assets/images/glow.png',
                        height: 50,
                      ),
                      radius: 40.0,
                    ),
                  ),
                ),
              )
            : SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            _showchart
                                ? Text(
                                    "  INDIA",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  )
                                : Text(
                                    '  GLOBAL',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.25),
                            Switch.adaptive(
                              activeColor: kPrimaryColor,
                                    inactiveTrackColor: Colors.green[200],
                                value: _showchart,
                               
                                onChanged: (val) {
                                  setState(() {
                                    _showchart = val;
                                  });
                                  Navigator.pushReplacement(context, route);
                                })
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 16),
                        child: ListView.builder(
                            itemCount: newslist.length,
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return NewsTile(
                                imgUrl: newslist[index].urlToImage ?? "",
                                title: newslist[index].title ?? "",
                                desc: newslist[index].description ?? "",
                                content: newslist[index].content ?? "",
                                posturl: newslist[index].articleUrl ?? "",
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
