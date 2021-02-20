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
        body: Container(color: Colors.white),
        drawer: Drawer(
          child: ListView(padding: EdgeInsets.zero, children: [
            UserAccountsDrawerHeader(
                currentAccountPicture: Image.network(
                    'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8dXNlcnxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60'),
                accountName: Text("Account"),
                accountEmail: Text("xyz@gmail.com")),

            // DrawerHeader(
            //   child: Text('A',
            //       style: TextStyle(
            //           color: Colors.white,
            //           fontSize: 24,
            //           fontWeight: FontWeight.bold)),
            //   decoration: BoxDecoration(color: Colors.red),
            // ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Account'),
              subtitle: Text('Personal'),
              trailing: Icon(Icons.edit),
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('Email'),
              subtitle: Text('abc@gmail.com'),
              trailing: Icon(Icons.email),
            ),
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.edit),
        ));
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
