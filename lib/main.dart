import 'package:flutter/material.dart';
import 'package:my_app/pages/login_page.dart';
import 'pages/home_page.dart';

void main() {
  runApp(MaterialApp(
    title: "My App",
    theme: ThemeData(primarySwatch: Colors.purple),
    home: LoginPage(),
    routes: {
      '/login': (context) => LoginPage(),
      '/home': (context) => HomePage(),
    },
  ));
}
