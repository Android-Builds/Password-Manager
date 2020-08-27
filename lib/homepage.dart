import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int maxLines = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Password Manager'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ListTile(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              title: Text('Include Uppercase Alphabets'),
              trailing: Checkbox(value: true, onChanged: null),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              title: Text('Include Uppercase Alphabets'),
              trailing: Checkbox(value: true, onChanged: null),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              title: Text('Include Uppercase Alphabets'),
              trailing: Checkbox(value: true, onChanged: null),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                readOnly: true,
                maxLines: maxLines,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "University",
                  fillColor: Colors.grey,
                  filled: true,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
