import 'package:flutter/material.dart';

class PrototypePage extends StatefulWidget {
  PrototypePage({Key key}) : super(key: key);

  @override
  PrototypePageState createState() => PrototypePageState();
}

class PrototypePageState extends State<PrototypePage> {
  bool expandFlag = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prototype'),
      ),
      body: Column(
        children: <Widget>[ new ExpandableContainer(
              expanded: expandFlag,
              child: new ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return new Container(
                    decoration:
                        new BoxDecoration(border: new Border.all(width: 1.0, color: Colors.grey), color: Colors.black),
                    child: new ListTile(
                      title: new Text(
                        "Cool $index",
                        style: new TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      leading: new Icon(
                        Icons.local_pizza,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
                itemCount: 15,
              ))
        ],
      ),
    );
  }
}

class ExpandableContainer extends StatelessWidget {
  final bool expanded;
  final double collapsedHeight;
  final double expandedHeight;
  final Widget child;

  ExpandableContainer({
    @required this.child,
    this.collapsedHeight = 0.0,
    this.expandedHeight = 300.0,
    this.expanded = true,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return new AnimatedContainer(
      duration: new Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      width: screenWidth,
      height: expanded ? expandedHeight : collapsedHeight,
      child: new Container(
        child: child,
        decoration: new BoxDecoration(border: new Border.all(width: 1.0, color: Colors.blue)),
      ),
    );
  }
}