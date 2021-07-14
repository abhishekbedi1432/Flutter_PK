import 'package:flutter/material.dart';
import 'package:my_app/pages/home_page_with_fb.dart';
import 'package:my_app/pages/login_page.dart';
import 'package:my_app/pages/order_list_with_fb.dart';
import 'package:my_app/utils/Constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/home_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Constants.prefs = await SharedPreferences.getInstance();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "My App",
    theme: ThemeData(primarySwatch: Colors.purple),
    home: Constants.prefs.getBool('isLoggedIn') == true
        ? LoginPage()
        : OrderListFB(),
    routes: {
      '/login': (context) => LoginPage(),
      '/home': (context) => OrderListFB(),
    },
  ));
}
