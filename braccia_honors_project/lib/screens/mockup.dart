import 'package:flutter/material.dart';
import 'package:braccia_honors_project/classes/lists.dart';
import 'package:braccia_honors_project/classes/items.dart';

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
      children: <Widget>[],
    );
  }

  stateChangeFunction() {
    setState(() {});
  }
}

class CheckListItem extends StatelessWidget {
  final String title;
  bool checked;
  final String dueDate;
  final String dateAdded;
  final String notes;
  final Function checkedFunction;
  CheckListItem(
      {this.title,
      this.checked,
      this.dueDate,
      this.dateAdded,
      this.notes,
      this.checkedFunction});

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(
          border: new Border.all(width: 1.0, color: Colors.grey),
          color: Colors.white),
      child: new ListTile(
        title: new Text(
          title,
          style:
              new TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        leading: Checkbox(
          value: checked,
          activeColor: Colors.black,
          onChanged: (bool value) {
            checked = value;
            checkedFunction(value: value, currentValueRef: checked);
          },
        ),
      ),
    );
  }
}

List<TodoList> lists = [
  new TodoList('School', [new Item(), new Item()]),
  new TodoList('Work', [new Item(), new Item()]),
];
