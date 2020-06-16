import 'package:flutter/material.dart';
class Profile{
  String imagePath;
  String name;

Profile({
  this.imagePath, this.name});
}

 final List<Profile> profiles=[
    Profile(
      imagePath:"assets/images/raviteja.JPG",
      name: "Raviteja Kampati"
    ),
     Profile(
      imagePath:"assets/images/rohithmone.jpg",
      name: "Rohith Mone"
    ),
     Profile(
      imagePath:"assets/images/sivafinal.jpg",
      name: "Siva Sai Ojam"
    ),
 ] ;