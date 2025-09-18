import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_counter_app/ConstrainedBoxClass.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  List names = ["Marcel", "Arina", "Daniel", "Melissa", "Kedir", "Ferhat"];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GridView(gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: crossAxisCount), itemBuilder: itemBuilder)
    );
  }
}
