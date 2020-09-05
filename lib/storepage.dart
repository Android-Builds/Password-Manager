import 'package:PassManager/utils/constants.dart';
import 'package:flutter/material.dart';

class StoragePage extends StatefulWidget {
  @override
  _StoragePageState createState() => _StoragePageState();
}

class _StoragePageState extends State<StoragePage> {
  TextEditingController _username = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  TextEditingController _url = new TextEditingController();
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
                controller: _username,
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
                controller: _password,
                readOnly: true,
                obscureText: true,
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
          ListTile(
            title: Text('Url: '),
            subtitle: Expanded(
              child: TextField(
                controller: _url,
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
