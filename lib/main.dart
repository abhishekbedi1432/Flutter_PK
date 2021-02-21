import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(MaterialApp(
    title: "My App",
    theme: ThemeData(primarySwatch: Colors.purple),
    home: HomePage(),
  ));
}
