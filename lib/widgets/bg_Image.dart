import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        'assets/bg.jpeg',
        fit: BoxFit.fill,
        color: Colors.black.withOpacity(0.5),
        colorBlendMode: BlendMode.darken,
      ),
    );
  }
}
