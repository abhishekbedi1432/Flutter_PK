import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
    );
  }
}
