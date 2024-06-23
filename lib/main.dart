import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jamal_ke_dohe/screens/home/view/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
