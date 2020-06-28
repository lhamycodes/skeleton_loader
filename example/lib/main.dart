import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String appTitle = "Flutter Skeleton Loader Demo";
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.openSansTextTheme(),
        primaryTextTheme: GoogleFonts.openSansTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      home: Home(title: appTitle),
    );
  }
}
