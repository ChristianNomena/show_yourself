import 'package:flutter/material.dart';
import 'package:show_yourself/screens/home_screen.dart';
import 'package:show_yourself/screens/loading_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Show Yourself',
      theme: ThemeData.dark(),
      /*theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
       */
      home: LoadingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
