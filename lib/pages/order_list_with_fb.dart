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
          title: Text("Returns and Refunds"),
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context, false),
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
    var boxDecoration = BoxDecoration(
        color: HexColor('#ECF4FD'),
        border: Border.all(
          color: Colors.red[500],
        ),
        borderRadius: BorderRadius.all(Radius.circular(20)));

    return Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(top: 10.0),
        decoration: boxDecoration,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              LeftRightTextWidget(
                leftText: 'Return Number: 123',
                rightText: 'Return Date: July 15, 2021',
              ),
              ReportedItemsWidget()
            ],
          ),
        ));
  }
}

class ReportedItemsWidget extends StatelessWidget {
  const ReportedItemsWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var boxDecoration = BoxDecoration(
        color: HexColor('#FFFFFF'),
        border: Border.all(
          color: Colors.red[200],
        ),
        borderRadius: BorderRadius.all(Radius.circular(20)));

    return Container(
      // height: 230,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2,
      padding: const EdgeInsets.all(20.0),
      decoration: boxDecoration,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Reported Items",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        LeftRightTextWidget(
          leftText: 'Order Number: 123',
          rightText: 'Order Date: July 15, 2021',
        ),
        ReturnStatusWidget(
          returnStatus: 'Return Initiated',
        ),
      ]),
    );
  }
}

class LeftRightTextWidget extends StatelessWidget {
  String leftText = "";
  String rightText = "";

  LeftRightTextWidget({
    Key key,
    @required this.leftText,
    @required this.rightText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        children: [Text("$leftText"), Spacer(), Text("$rightText")],
      ),
    );
  }
}

class ReturnStatusWidget extends StatelessWidget {
  // String iconUrl = "";
  String returnStatus = "";

  ReturnStatusWidget({
    Key key,
    // @required this.iconUrl,
    @required this.returnStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.network(
              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
          // Spacer(flex: 10),
          Text("$returnStatus")
        ],
      ),
    );
  }
}
