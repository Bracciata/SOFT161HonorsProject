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
      body: Column(
        children: <Widget>[
          new ExpandableListStatefulWidget(
              expanded: true,
              name: 'School',
              child: new ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  print('item $index');
                  bool itemChecked = false;
                  return new Container(
                    decoration: new BoxDecoration(
                        border: new Border.all(width: 1.0, color: Colors.grey),
                        color: Colors.white),
                    child: new ListTile(
                      title: new Text(
                        "Cool $index",
                        style: new TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      leading: Checkbox(
                        value: itemChecked,
                        activeColor: Colors.black,
                        onChanged: (bool value) {
                          setState(() {
                            itemChecked = value;
                          });
                        },
                      ),
                    ),
                  );
                },
                itemCount: 3,
              )),
          new ExpandableListStatefulWidget(
              expanded: false,
              name: 'Work',
              child: new ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  bool itemChecked = false;
                  return new Container(
                    decoration: new BoxDecoration(
                        border: new Border.all(width: 1.0, color: Colors.grey),
                        color: Colors.white),
                    child: new ListTile(
                      title: new Text(
                        "Cool $index",
                        style: new TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      leading: Checkbox(
                        value: itemChecked,
                        activeColor: Colors.black,
                        onChanged: (bool value) {
                          setState(() {
                            itemChecked = value;
                          });
                        },
                      ),
                    ),
                  );
                },
                itemCount: 3,
              ))
        ],
      ),
    );
  }
}

class ExpandableListStatefulWidget extends StatefulWidget {
  final bool expanded;
  final Widget child;
  final String name;

  ExpandableListStatefulWidget(
      {@required this.child, this.expanded = true, this.name = 'blank'});
  @override
  ExpandableList createState() => ExpandableList(
      expanded: this.expanded, child: this.child, name: this.name);
}

class ExpandableList extends State<ExpandableListStatefulWidget> {
  bool expanded;
  final Widget child;
  final String name;

  ExpandableList(
      {@required this.child, @required this.expanded, @required this.name});

  @override
  Widget build(BuildContext context) {
    return new ExpansionTile(
      initiallyExpanded: expanded,
      title: Text(name),
      children: <Widget>[child],
    );
  }
}

/*class CheckListItem extends StatelessWidget {
  final String text;
  final String checked;
  final String dueDate;
  final String dateAdded;
  final String notes;
}*/
