import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/bg_Image.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var children2 = [
      BackgroundImage(),
      Center(
          child: Card(
              child: Column(
        children: [
          Form(
            child: TextFormField(
                decoration: InputDecoration(
                    labelText: 'Username', hintText: 'Enter Username')),
          )
        ],
      )))
    ];
    return Scaffold(
      appBar: AppBar(title: Text('Login Page')),
      body: Stack(
        fit: StackFit.expand,
        children: children2,
      ),
    );
  }
}
