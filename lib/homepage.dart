import 'package:PassManager/models/generator.dart';
import 'package:PassManager/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int maxLines = 4;
  double _sliderValue = 10.0;
  final _scaffoldkey = GlobalKey<ScaffoldState>();
  TextEditingController _controller = new TextEditingController();

  getButton() {
    return _controller.text == ''
        ? MaterialButton(
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
            onPressed: () async {
              if (!uppercase && !lowercase && !specialchars && !numbers) {
                _scaffoldkey.currentState.removeCurrentSnackBar();
                _scaffoldkey.currentState.showSnackBar(SnackBar(
                  content: Text('Select atleast one value'),
                  duration: Duration(milliseconds: 500),
                ));
              } else {
                Generator generator = new Generator();
                await generator.addFunctions();
                setState(() {
                  _controller.text = generator.generate(_sliderValue.toInt());
                });
              }
            },
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  minWidth: 140,
                  height: 70,
                  onPressed: () {
                    setState(() {
                      _controller.clear();
                    });
                  },
                  color: Colors.blue,
                  child: Text('Reset'),
                ),
                Spacer(),
                MaterialButton(
                  minWidth: 140,
                  height: 70,
                  color: Colors.blue,
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: _controller.text));
                    _scaffoldkey.currentState.showSnackBar(SnackBar(
                      content: Text('Copied'),
                      duration: Duration(milliseconds: 1000),
                    ));
                  },
                  child: Text('Copy'),
                ),
              ],
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    darkmode =
        MediaQuery.of(context).platformBrightness == Brightness.dark ?? false;
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text('Password Manager'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ListTile(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 5.0,
              ),
              title: Text('Include Uppercase Alphabets'),
              trailing: Checkbox(
                activeColor: Colors.blue,
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
                vertical: 5.0,
              ),
              title: Text('Include Lowercase Alphabets'),
              trailing: Checkbox(
                activeColor: Colors.blue,
                value: lowercase,
                onChanged: (value) {
                  setState(() {
                    lowercase = value;
                  });
                },
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 5.0,
              ),
              title: Text('Include Special Characters'),
              trailing: Checkbox(
                activeColor: Colors.blue,
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
                vertical: 5.0,
              ),
              title: Text('Include Numbers'),
              trailing: Checkbox(
                activeColor: Colors.blue,
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
                vertical: 5.0,
              ),
              title: Text('Password Length: '),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        if (_sliderValue >= 10) {
                          setState(() {
                            _sliderValue -= 1.0;
                          });
                        }
                      },
                    ),
                    Expanded(
                      child: Slider(
                        inactiveColor: Colors.grey[350],
                        min: 10.0,
                        max: 50.0,
                        value: _sliderValue,
                        onChanged: (value) {
                          setState(() {
                            _sliderValue = value;
                          });
                        },
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        if (_sliderValue <= 50) {
                          setState(() {
                            _sliderValue += 1.0;
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
                _sliderValue.toInt().toString(),
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
              child: TextField(
                controller: _controller,
                readOnly: true,
                maxLines: maxLines,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Password',
                  fillColor: darkmode ? Colors.grey[800] : Colors.grey[350],
                  filled: true,
                ),
              ),
            ),
            getButton(),
          ],
        ),
      ),
    );
  }
}
