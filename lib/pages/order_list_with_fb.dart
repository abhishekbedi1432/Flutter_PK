// ignore_for_file: missing_return

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_app/utils/Constants.dart';
import 'package:hexcolor/hexcolor.dart';

class OrderListFB extends StatelessWidget {
  Future getData() async {
    var url = "https://jsonplaceholder.typicode.com/photos";
    print('Fetching Data From Network!');
    var res = await http.get(url);
    var data = jsonDecode(res.body);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    // BODY
    var body = FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              print('ConnectionState.none');
              return Center(child: Text('Fetch Something'));
            case ConnectionState.active:
              print('ConnectionState.active');
              return Center(child: Text('Fetching ...'));
            case ConnectionState.waiting:
              print('ConnectionState.waiting');
              return Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              print('ConnectionState.done');
              if (snapshot.hasError) {
                return Center(child: Text('Some Error Occurred!'));
              } else {
                return ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: snapshot.data == null ? 0 : snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                            // color: Colors.tealAccent,
                            child: OrderListItem()),
                      );
                    });
              }
          }
        });

    return Scaffold(
        appBar: AppBar(
          title: Text("Order List"),
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
                    onTap: () {
                      Constants.prefs.setBool('isLoggedIn', false);
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    child: Icon(Icons.exit_to_app))),
          ],
        ),
        body: body);
  }
}

class OrderListItem extends StatelessWidget {
  const OrderListItem({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
          color: HexColor('#ECF4FD'),
          border: Border.all(
            color: Colors.red[500],
          ),
          borderRadius: BorderRadius.all(Radius.circular(20))),
    );
  }
}
