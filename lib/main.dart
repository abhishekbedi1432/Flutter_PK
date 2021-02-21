import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "My App",
    theme: ThemeData(primarySwatch: Colors.purple),
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var myText = 'Change Me';
  TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("App Title")),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Card(
              child: Column(
                children: <Widget>[
                  Image.asset(
                    'assets/bg.jpeg',
                    fit: BoxFit.fill,
                    height: 350,
                  ),
                  SizedBox(
                      height: 30,
                      child: Text(
                        myText,
                        style: TextStyle(fontSize: 24),
                      )),
                  TextField(
                    controller: _nameController,
                    keyboardType: TextInputType.name,
                    decoration:
                        InputDecoration(hintText: 'Hint', labelText: 'Label'),
                  )
                ],
              ),
            ),
          ),
        ),
        drawer: Drawer(
          child: ListView(padding: EdgeInsets.zero, children: [
            UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8dXNlcnxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60'),
                ),
                accountName: Text("Account"),
                accountEmail: Text("xyz@gmail.com")),
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
          onPressed: () {
            myText = _nameController.text;
            setState(() {});
          },
          child: Icon(Icons.edit),
        ));
  }
}
