import 'package:flutter/material.dart';
import 'package:my_app/bg_Image.dart';
import 'package:my_app/utils/Constants.dart';
// import 'package:my_app/main.dart';

// import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login Page"),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [BackgroundImage(), LoginCard()],
        ));
  }
}

class LoginCard extends StatelessWidget {
  const LoginCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
            child: Card(
          child: Column(
            children: [
              Form(
                  child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Enter User Name', labelText: 'Username'),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: 'Enter Password', labelText: 'Password'),
                    ),
                  ],
                ),
              )),
              SizedBox(height: 50),
              RaisedButton(
                onPressed: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => HomePage()));
                  Constants.prefs.setBool('isLoggedIn', true);
                  Navigator.pushReplacementNamed(context, '/home');
                },
                child: Text('Sign In'),
                color: Colors.redAccent,
                textColor: Colors.white,
              ),
              SizedBox(height: 50),
            ],
          ),
        )),
      ),
    );
  }
}
