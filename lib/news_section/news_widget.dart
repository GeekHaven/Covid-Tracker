import 'package:covidtracker/constants.dart';
import 'package:flutter/material.dart';
import './article_view.dart';
import 'package:covidtracker/config.dart';

Widget MyAppBar(){
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Corona",
          style:
          TextStyle(color: Colors.black87, fontWeight: FontWeight.w600, fontSize: 2.39 * SizeConfig.textMultiplier),
        ),
        Text(
          " News",
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600, fontSize: 2.39 * SizeConfig.textMultiplier),
        )
      ],
    ),
    backgroundColor: kPrimaryColor,
  );
}


class NewsTile extends StatelessWidget {
  final String imgUrl, title, desc, content, posturl;

  NewsTile({this.imgUrl, this.desc, this.title, this.content, @required this.posturl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => ArticleView(
              postUrl: posturl,
            )
        ));
      },
      child: Container(
          margin: EdgeInsets.only(bottom: 2.61 * SizeConfig.heightMultiplier),
          width: MediaQuery.of(context).size.width,
          child: Container(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 3.8 * SizeConfig.widthMultiplier),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(0.65 * SizeConfig.heightMultiplier),bottomLeft:  Radius.circular(6))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.circular(0.65 * SizeConfig.heightMultiplier),
                      child: Image.network(
                        imgUrl,
                        height: 22 * SizeConfig.heightMultiplier,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      )),
                  SizedBox(height: 1.3 * SizeConfig.heightMultiplier,),
                  Text(
                    title,
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 2.18 * SizeConfig.textMultiplier,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 0.44 * SizeConfig.heightMultiplier,
                  ),
                  Text(
                    desc,
                    maxLines: 2,
                    style: TextStyle(color: Colors.black54, fontSize:  1.52 * SizeConfig.textMultiplier),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
