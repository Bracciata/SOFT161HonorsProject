import 'package:flutter/material.dart';
import 'mockup.dart';
import 'prototype.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _openMockup() {
    setState(() {
      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (BuildContext context) => new MockupPage()));
    });
  }

  void _openPrototype() {
    setState(() {
      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (BuildContext context) => new PrototypePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Select version to open',
            ),
            FlatButton(
              onPressed: _openMockup,
              child: Text('Mockup'),
            ),
            FlatButton(onPressed: _openPrototype, child: Text('Prototype')),
          ],
        ),
      ),
    );
  }
}
