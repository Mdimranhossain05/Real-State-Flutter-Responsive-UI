import 'dart:ui';
import 'package:first_project/Constrain.dart';
import 'package:first_project/screens/descriptionScreen.dart';
import 'package:first_project/screens/landing_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = window.physicalSize.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Episode 1",
      theme: ThemeData(primaryColor: COLOR_WHITE,accentColor: COLOR_DARK_BLUE,textTheme: screenWidth<500? TEXT_THEME_SMALL : TEXT_THEME_DEFAULT,),
      home: LandingScreen(),
    );
  }
}

