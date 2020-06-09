import 'package:flutter/material.dart';
class CardModel {
  String title;
  String imageSource;
  Color _cardColor;
  
   CardModel({@required this.title, @required this.imageSource, Color cardColor = Colors.blueAccent}) {
    this._cardColor = cardColor;
  }
  Color get cardColor => this._cardColor;
}