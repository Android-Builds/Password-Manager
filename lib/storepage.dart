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
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
      child: Column(
        children: [
          ListTile(
            title: Text('Username / Email: '),
            subtitle: Expanded(
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
          ),
          SizedBox(height: 20),
          ListTile(
            title: Text('Password: '),
            subtitle: Expanded(
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
          ),
        ],
      ),
    );
  }
}
