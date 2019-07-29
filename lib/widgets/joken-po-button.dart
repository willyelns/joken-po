import 'package:flutter/material.dart';

class JokenPoButton extends StatelessWidget {
  final String imagePath;
  final Function callbackFunction;

  const JokenPoButton({Key key, this.imagePath, this.callbackFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.callbackFunction,
      child: Image.asset(this.imagePath, height: 100),
    );
  }
}
