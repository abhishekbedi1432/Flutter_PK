import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "My App",
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("App Title")),
        body: Container(child: Center(child: Text("Abhishek Bedi"))));
  }
}
