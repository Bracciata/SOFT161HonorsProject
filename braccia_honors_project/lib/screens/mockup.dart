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
    List<TodoList> listOfTodoLists = null;
    return Scaffold(
      appBar: AppBar(
        title: Text('Mockup'),
      ),
      body: Column(
        children: <Widget>[
          new ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              bool defaultExpanded = index == 0;
              return new ExpandableListStatefulWidget(
                  expanded: defaultExpanded, theList: listOfTodoLists[index]);
            },
            itemCount: 3,
          )
        ],
      ),
    );
  }
}

class ExpandableListStatefulWidget extends StatefulWidget {
  final bool expanded;
  final TodoList theList;

  ExpandableListStatefulWidget({this.theList, this.expanded = true});
  @override
  ExpandableList createState() => ExpandableList(
        expanded: this.expanded,
        theList: this.theList,
      );
}

class ExpandableList extends State<ExpandableListStatefulWidget> {
  bool expanded;
  final TodoList theList;

  ExpandableList({this.theList, @required this.expanded});

  @override
  Widget build(BuildContext context) {
    return new ExpansionTile(
      initiallyExpanded: expanded,
      title: Text(theList.name),
      children: <Widget>[
        new ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              bool defaultExpanded = index == 0;
              return new CheckListItem(
                  todoItem: theList.todoItems[index],
                  checkedFunction: StateChangeFunction);
            },
            itemCount: theList.todoItems.length)
      ],
    );
  }

  StateChangeFunction() {
    setState(() {});
  }
}

class CheckListItem extends StatelessWidget {
  final Item todoItem;
  final Function checkedFunction;
  CheckListItem({@required this.todoItem, @required this.checkedFunction});

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(
          border: new Border.all(width: 1.0, color: Colors.grey),
          color: Colors.white),
      child: new ListTile(
        title: new Text(
          todoItem.title,
          style:
              new TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        leading: Checkbox(
          value: todoItem.checked,
          activeColor: Colors.black,
          onChanged: (bool value) {
            todoItem.checked = value;
            checkedFunction(value: value, currentValueRef: todoItem.checked);
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
