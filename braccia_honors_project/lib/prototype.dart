import 'package:flutter/material.dart';

class PrototypePage extends StatefulWidget {
  PrototypePage({Key key}) : super(key: key);

  @override
  PrototypePageState createState() => PrototypePageState();
}

class PrototypePageState extends State<PrototypePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prototype'),
      ),
      body: Center(),
    );
  }
}
