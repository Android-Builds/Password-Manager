import 'package:PassManager/homepage.dart';
import 'package:PassManager/utils/constants.dart';
import 'package:flutter/material.dart';

class PinPage extends StatefulWidget {
  @override
  _PinPageState createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> {
  String _password = '';
  List<FocusNode> node = List<FocusNode>();
  List<TextEditingController> controller = List<TextEditingController>();
  List<String> numbers = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'];

  bool isNumber(String string) {
    return numbers.contains(string);
  }

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 6; i++) {
      node.add(new FocusNode());
      controller.add(new TextEditingController());
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
                        controller: controller[index],
                        maxLength: 1,
                        focusNode: node[index],
                        autofocus: true,
                        showCursor: true,
                        onChanged: (value) {
                          if (value.isEmpty) {
                            _password =
                                _password.substring(0, _password.length - 1);
                            node[index].previousFocus();
                          } else {
                            if (!isNumber(value)) {
                              controller[index].clear();
                            } else {
                              _password += value;
                              node[index].nextFocus();
                            }
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
                if (_password == '123456') {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                }
              })
        ],
      ),
    );
  }
}
