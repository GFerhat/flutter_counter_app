import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_counter_app/ConstrainedBoxClass.dart';
import 'package:flutter_counter_app/pages/first_page.dart';
import 'package:flutter_counter_app/pages/second_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
      routes: {
        '/firstpage': (context) => FirstPage(),

        '/secondpage': (context) => SecondPage(),
      },
    );
  }
}
