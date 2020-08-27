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
            ListTile(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              title: Text('Password Length: '),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        if (sliderValue >= 10) {
                          setState(() {
                            sliderValue -= 1.0;
                          });
                        }
                      },
                    ),
                    Expanded(
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
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        if (sliderValue <= 50) {
                          setState(() {
                            sliderValue += 1.0;
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Text(
                sliderValue.toInt().toString(),
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
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
              minWidth: 180,
              height: 60,
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
