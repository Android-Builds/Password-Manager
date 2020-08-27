import 'package:PassManager/utils/constants.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int maxLines = 4;
  double sliderValue = 10.0;
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
              trailing: Checkbox(
                value: uppercase,
                onChanged: (value) {
                  setState(() {
                    uppercase = value;
                  });
                },
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              title: Text('Include Special Characters'),
              trailing: Checkbox(
                value: specialchars,
                onChanged: (value) {
                  setState(() {
                    specialchars = value;
                  });
                },
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              title: Text('Include Numbers'),
              trailing: Checkbox(
                value: numbers,
                onChanged: (value) {
                  setState(() {
                    numbers = value;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              child: Slider(
                min: 10.0,
                max: 50.0,
                divisions: 8,
                value: sliderValue,
                onChanged: (value) {
                  setState(() {
                    sliderValue = value;
                  });
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                readOnly: true,
                maxLines: maxLines,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "University",
                  fillColor: Colors.grey[350],
                  filled: true,
                ),
              ),
            ),
            MaterialButton(
              minWidth: 200,
              height: 80,
              child: Text(
                'Generate',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              color: Colors.blue,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
