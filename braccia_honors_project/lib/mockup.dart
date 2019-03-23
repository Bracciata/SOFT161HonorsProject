import 'package:flutter/material.dart';

class MockupPage extends StatefulWidget {
  MockupPage({Key key}) : super(key: key);

  @override
  MockupPageState createState() => MockupPageState();
}

class MockupPageState extends State<MockupPage> {
  bool expandFlag = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mockup'),
      ),
      body: Column(
        children: <Widget>[
          new ExpandableContainer(
              expanded: expandFlag,
              child: new ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  print('item $index');
                  return new Container(
                    decoration: new BoxDecoration(
                        border: new Border.all(width: 1.0, color: Colors.grey),
                        color: Colors.white),
                    child: new ListTile(
                        title: new Text(
                      "Cool $index",
                      style: new TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    )),
                  );
                },
                itemCount: 3,
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
  final String listTitle;

  ExpandableContainer({
    @required this.child,
    this.collapsedHeight = 0.0,
    this.expandedHeight = 300.0,
    this.expanded = true,
    this.listTitle = 'blank'
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return new Column(children: [
      CheckListTitle(name: listTitle, expanded: this.expanded,),
      AnimatedContainer(
        duration: new Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        width: screenWidth,
        height: expanded ? expandedHeight : collapsedHeight,
        child: new Container(
          child: child,
        ),
      )
    ]);
  
  }
}
class CheckListTitle extends StatelessWidget {
  final bool expanded;
  final String name;
   CheckListTitle({
    @required this.name,
    this.expanded = true,
  });
  @override
  Widget build(BuildContext context) {
    return new Row(children: [
    Text(name),
    Text(expanded?'Λ':'V')
    ],
    );
  }
}
class CheckListItem extends StatelessWidget{
  final String text;
  final String checked;
  final String dueDate;
  final String dateAdded;
  final String notes;
}

