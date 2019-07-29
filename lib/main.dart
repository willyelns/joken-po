import 'package:flutter/material.dart';
import 'package:jokenpo/pages/gamepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jo Ken Po',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: GamePage(title: 'Jo Ken Po'),
    );
  }
}
