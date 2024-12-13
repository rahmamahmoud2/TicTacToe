import 'package:flutter/material.dart';
import 'package:xo_application/gam.dart';
import 'package:xo_application/playing.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'game',
      routes: {
        'game': (context) => theGame(),
        'playing': (context) => Playing(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
