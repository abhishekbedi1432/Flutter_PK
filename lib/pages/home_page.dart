import 'package:flutter/material.dart';
import 'dart:convert';
// import 'package:my_app/change_name_card.dart';
// import 'package:my_app/drawer.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var myText = 'Change Me';
  var url = "https://jsonplaceholder.typicode.com/photos";

  final List<String> entries = <String>['Abhishek', 'Bedi', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  var data;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    var res = await http.get(url);
    data = jsonDecode(res.body);
    print(data);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("App Title")),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: data == null
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                          color: Colors.amber,
                          child: ListTile(
                              title: Text(
                                  '${data[index]['id']}. ${data[index]['title']}'))),
                    );
                  }),
        ));
  }
}
