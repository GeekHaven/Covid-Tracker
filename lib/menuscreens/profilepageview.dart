import 'package:flutter/material.dart';
import 'package:covidtracker/menuscreens/profile.dart';

//import 'package:flutter/foundation.dart';
class ProfilePageView extends StatefulWidget {
  var index;
  ProfilePageView(this.index);
  final PageController _pageController = PageController(initialPage: 0);
  @override
  _ProfilePageViewState createState() => _ProfilePageViewState();
}

class _ProfilePageViewState extends State<ProfilePageView>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  //var index=0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        itemCount: profiles.length,
        controller: widget._pageController,
        pageSnapping: true,
        onPageChanged: (index) {
          setState(() {
            index++;
          });
        },
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Image.asset(
            profiles[index].imagePath,
            fit: BoxFit.cover,
            colorBlendMode: BlendMode.hue,
          );
        });
  }
}
