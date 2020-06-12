import 'package:flutter/material.dart';
import './news_widget.dart';

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
        backgroundColor: Colors.blue,
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
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
        ),
        SizedBox(width:30),
      ],
    ),
      ),
      
      body: SafeArea(
        child: _loading
            ? Center(
                child: CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
                ),
              )
            : SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      /////we nneed to write code to select country or global
                      ///

                      /// News Article
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
