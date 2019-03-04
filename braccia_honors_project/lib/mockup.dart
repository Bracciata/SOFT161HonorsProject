import 'package:flutter/material.dart';

class MockupPage extends StatefulWidget {
  MockupPage({Key key}) : super(key: key);

  @override
  MockupPageState createState() => MockupPageState();
}

class MockupPageState extends State<MockupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mockup'),
      ),
      body: Center(),
    );
  }
}
