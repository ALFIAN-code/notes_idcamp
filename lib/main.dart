import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:notes/pages/homepage.dart';

void main(List<String> args) {
  runApp(const MyApp()); 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}