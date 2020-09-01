import 'package:PassManager/utils/constants.dart';
import 'package:flutter/material.dart';

class StoragePage extends StatefulWidget {
  @override
  _StoragePageState createState() => _StoragePageState();
}

class _StoragePageState extends State<StoragePage> {
  TextEditingController _controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            children: [
              Text('Username / Email: '),
              Expanded(
                child: TextField(
                  controller: _controller,
                  readOnly: true,
                  maxLines: 1,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Password',
                    fillColor: darkmode ? Colors.grey[800] : Colors.grey[350],
                    filled: true,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Text('Password: '),
              Expanded(
                child: TextField(
                  controller: _controller,
                  readOnly: true,
                  maxLines: 1,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Password',
                    fillColor: darkmode ? Colors.grey[800] : Colors.grey[350],
                    filled: true,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
