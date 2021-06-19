import 'package:flutter/material.dart';
import 'pallete.dart';
import 'screens/screens.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Spotify Clone',
      debugShowCheckedModeBanner: false,
      darkTheme: Pallete.darkTheme,
      home: Shell(),
    );
  }
}