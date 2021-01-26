import 'package:flutter/material.dart';

import 'AllScreens/loginScreen.dart';
import 'AllScreens/main_screen.dart';
import 'AllScreens/registerScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Texi Rider App',
      theme: ThemeData(
        fontFamily: "Brand-Bold",
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Registerscreen(),
    );
  }
}
