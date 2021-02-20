import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "My App",
    theme: ThemeData(primarySwatch: Colors.purple),
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("App Title")),
      body: Container(color: Colors.yellow),
      drawer: Drawer(child: Container(color: Colors.red)),
    );
  }
}

/*

Container(
          width: 100,
          height: 100,
          child: Text('Box'),
          decoration: BoxDecoration(
              color: Colors.yellowAccent,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[400],
                    blurRadius: 5,
                    offset: Offset(2, 5)),
              ],
              gradient: LinearGradient(colors: [Colors.yellow, Colors.pink])),
          alignment: Alignment.center,
        )
        
         */
