import 'package:PassManager/utils/constants.dart';
import 'package:flutter/material.dart';

class PinPage extends StatefulWidget {
  @override
  _PinPageState createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> {
  String _password = '';
  List<FocusNode> nodes = List<FocusNode>();

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 6; i++) {
      nodes.add(new FocusNode());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 200,
            child: ListView.builder(
                padding: EdgeInsets.all(20.0),
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Center(
                    child: Container(
                      height: 60.0,
                      width: 55.0,
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      child: TextField(
                        controller: new TextEditingController(),
                        maxLength: 1,
                        focusNode: nodes[index],
                        autofocus: true,
                        showCursor: true,
                        onChanged: (value) {
                          _password += value;
                          if (value == '') {
                            nodes[index].previousFocus();
                          } else {
                            nodes[index].nextFocus();
                          }
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor:
                              darkmode ? Colors.grey[800] : Colors.grey[350],
                          filled: true,
                        ),
                      ),
                    ),
                  );
                }),
          ),
          MaterialButton(
              child: Text('Login'),
              minWidth: 120,
              height: 50,
              color: Colors.blue,
              onPressed: () {
                print(_password);
              })
        ],
      ),
    );
  }
}
