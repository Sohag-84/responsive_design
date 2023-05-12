// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:responsive_design/responsive/mobile_screen.dart';
import 'package:responsive_design/responsive/web_screen.dart';

import 'responsive/responsive_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter responsive design',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ResponsiveLayout(
        mobileScreenLayout: MobileScreen(),
        webScreenLayout: WebScreen(),
      ),
    );
  }
}
