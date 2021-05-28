import 'package:flutter/material.dart';
import 'dart:convert';
// import 'package:my_app/change_name_card.dart';
// import 'package:my_app/drawer.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

enum ViewType { list, grid }

class _HomePageState extends State<HomePage> {
  var url = "https://jsonplaceholder.typicode.com/photos";
  var data;

  var viewType = ViewType.list;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    print('Fetching Data From Network!');
    var res = await http.get(url);
    data = jsonDecode(res.body);
    print(data);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // Gridview Layout
    var gridView = GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        padding: const EdgeInsets.all(8),
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
                // color: Colors.tealAccent,
                child: ListTile(
                    leading: Image.network(data[index]['url']),
                    title:
                        Text('${data[index]['id']}. ${data[index]['title']}'))),
          );
        });

// Listview Layout
    var listView = ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
                // color: Colors.tealAccent,
                child: ListTile(
                    leading: Image.network(data[index]['url']),
                    title:
                        Text('${data[index]['id']}. ${data[index]['title']}'))),
          );
        });

// BODY
    var body = Padding(
        padding: const EdgeInsets.all(8.0),
        child: data == null
            ? Center(child: CircularProgressIndicator())
            : viewType == ViewType.list
                ? listView
                : gridView);

    return Scaffold(
        appBar: AppBar(
          title: Text("App Title"),
          leading: GestureDetector(
            onTap: () {/* Write listener code here */},
            child: Icon(
              Icons.menu, // add custom icons also
            ),
          ),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                    onTap: onRefreshPressed,s
                    child: viewType == ViewType.grid
                        ? Icon(Icons.view_list)
                        : Icon(Icons.grid_view))),
          ],
        ),
        body: body);
  }

  void onRefreshPressed() {
    viewType = viewType == ViewType.list ? ViewType.grid : ViewType.list;
    print(viewType);
    setState(() {});

    // print('Refresh Pressed!');
    // getData();
  }
}
