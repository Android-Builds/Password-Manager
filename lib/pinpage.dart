import 'package:PassManager/utils/constants.dart';
import 'package:flutter/material.dart';

class PinPage extends StatefulWidget {
  @override
  _PinPageState createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> {
  TextEditingController _controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = 55.0;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: width,
            padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 30.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: darkmode ? Colors.grey[800] : Colors.grey[350],
                filled: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
