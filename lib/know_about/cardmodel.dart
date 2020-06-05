import 'package:flutter/material.dart';
class CardModel {
  String title;
  String imageSource;
  Color _cardColor;
  
   CardModel({@required this.title, @required this.imageSource, Color cardColor = Colors.blueAccent}) {
    // this._title = title;
    // this._imageSource = imageSource;
    this._cardColor = cardColor;
  }

  // set title(String title) => this._title = title;
  // set imageSrc(String imageSource) => this._imageSource = imageSource;
  // set cardColor(Color cardColor) => this._cardColor = cardColor;

  //String get title => this._title;
  //String get imageSource => this._imageSource;
  Color get cardColor => this._cardColor;

  // @override
  // String toString() {
  //   return 'InfoCardModel { title : "${this._title}", imageSource : "${this._imageSource}", cardColor : "${this._cardColor}"}';
  // }
}