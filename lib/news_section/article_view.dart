import 'dart:async';
import 'package:flutter/material.dart';
import './news_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:covidtracker/config.dart';
import 'package:covidtracker/constants.dart';

class ArticleView extends StatefulWidget {
  final String postUrl;
  ArticleView({@required this.postUrl});

  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  bool _isloading = true;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
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
            SizedBox(width: 11.8 * SizeConfig.widthMultiplier),
          ],
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              child: WebView(
                initialUrl: widget.postUrl,
                javascriptMode: JavascriptMode.unrestricted,
                onPageFinished: (start) {
                  setState(() {
                    _isloading = false;
                  });
                },
                // onWebViewCreated: (WebViewController webViewController) {
                //   _controller.complete(webViewController);
                // },
              ),
            ),
            _isloading
                ? Center(
                    child: AvatarGlow(
                      glowColor: Colors.green,
                      endRadius: 9.8 * SizeConfig.heightMultiplier,
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
                            height: 5.45 * SizeConfig.heightMultiplier,
                          ),
                          radius: 4.36 * SizeConfig.heightMultiplier,
                        ),
                      ),
                    ),
                  )
                : Stack(),
          ],
        ),
      ),
    );
  }
}
