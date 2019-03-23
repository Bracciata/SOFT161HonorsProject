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
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}

class ListTitle extends StatelessWidget {
  final String name;
  final bool expanded;
  ListTitle({Key key, this.name, this.expanded}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new DropdownButton<String>(
      items: <String>['A', 'B', 'C', 'D'].map((String value) {
        return new DropdownMenuItem<String>(
          value: value,
          child: new Text(value),
        );
      }).toList(),
      onChanged: (_) {},
    );
  }
}
