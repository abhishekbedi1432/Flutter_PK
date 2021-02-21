import 'package:flutter/material.dart';

class ChangeNameCard extends StatelessWidget {
  const ChangeNameCard({
    Key key,
    @required this.myText,
    @required TextEditingController nameController,
  })  : _nameController = nameController,
        super(key: key);

  final String myText;
  final TextEditingController _nameController;

  @override
  Widget build(BuildContext context) {
    return Card(
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
            decoration: InputDecoration(hintText: 'Hint', labelText: 'Label'),
          )
        ],
      ),
    );
  }
}
