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
    List<TodoList> listOfTodoLists = lists;
    return Scaffold(
      appBar: AppBar(
        title: Text('Mockup'),
      ),
      body: Column(
        children: <Widget>[
          new Expanded(
              child: new ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return new ExpandableListStatefulWidget(
                  expanded: index == 0, theList: listOfTodoLists[index]);
            },
            itemCount: listOfTodoLists.length,
          ))
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
    return ExpansionTile(
      initiallyExpanded: expanded,
      title: new Text(theList.name),
      children: <Widget>[
        new ListView.builder(
          shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return new CheckListItem(
                  todoItem: theList.todoItems[index],
                  checkedFunction: stateChangeFunction);
            },
            itemCount: theList.todoItems.length)
      ],
    );
  }

  stateChangeFunction() {
    setState(() {});
  }
}

class CheckListItem extends StatelessWidget {
  final Item todoItem;
  final Function checkedFunction;
  CheckListItem({@required this.todoItem, @required this.checkedFunction});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: new Text(
        todoItem.name,
        style: new TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      ),
      leading: Checkbox(
        value: todoItem.checked,
        activeColor: Colors.black,
        onChanged: (bool value) {
          todoItem.checked = value;
          checkedFunction(value: value, currentValueRef: todoItem.checked);
        },
      ),
    );
  }
}

List<TodoList> lists = [
  new TodoList('School', [
    new Item(
        'Email Professor',
        'I need to email my physics professor by 9 tonight to get 10 points back on the exam.',
        new DateTime(2021),
        null,
        null,
        new DateTime(2020)),
    new Item('Prepare Poster For CSESAB', '', new DateTime(0), null, null,
        new DateTime(2021))
  ]),
  new TodoList('Work', [
    new Item('I will not be shown in mockup', '', new DateTime(2011), null,
        null, DateTime(2020)),
  ]),
];
