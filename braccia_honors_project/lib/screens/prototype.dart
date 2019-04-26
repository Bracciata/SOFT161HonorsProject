import 'package:flutter/material.dart';
import 'package:braccia_honors_project/classes/lists.dart';
import 'package:braccia_honors_project/classes/items.dart';

class PrototypePage extends StatefulWidget {
  PrototypePage({Key key}) : super(key: key);

  @override
  PrototypePageState createState() => PrototypePageState();
}

class PrototypePageState extends State<PrototypePage> {
  @override
  Widget build(BuildContext context) {
    List<TodoList> listOfTodoLists = lists;
    return Scaffold(
      appBar: AppBar(
        title: Text('Prototype'),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.add),
            tooltip: 'Add New List',
            onPressed: () {
              _onTapAdd(context);
            },
          )
        ],
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

  void _onTapAdd(BuildContext context) {
    var listName = "";
    showDialog(
        context: context,
        child: new AlertDialog(
          title: new Text("Add List"),
          content: new Column(
            children: [
              new Row(
                children: <Widget>[
                  new Expanded(
                      child: new TextField(
                    autofocus: true,
                    decoration: new InputDecoration(
                        labelText: 'List Name',
                        hintText: 'eg. Hobby, School, Work.'),
                    onChanged: (value) {
                      listName = value;
                    },
                  ))
                ],
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  lists.add(new TodoList(listName, []));
                  Navigator.pop(context);
                }),
            FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ));
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
      title: new InkWell(
        child: Text(theList.name),
        onLongPress: () {
          _deleteList();
        },
      ),
      children: <Widget>[
        new ListView.builder(
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return new CheckListItem(
                  todoItem: theList.todoItems[index],
                  checkedFunction: stateChangeFunction);
            },
            itemCount: theList.todoItems.length),
        new ListTile(
          leading: new Icon(Icons.add),
          title: new Text('Add item'),
          onTap: () => _onTapAdd(context),
        )
      ],
    );
  }

  void _deleteList() {
    showDialog(
        context: context,
        child: new AlertDialog(
          title: new Text(
              "Are you sure you would like to delete " + theList.name + "?"),
          actions: <Widget>[
            FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  lists.remove(theList);

                  stateChangeFunction();

                  Navigator.pop(context);
                }),
            FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ));
  }

  void _onTapAdd(BuildContext context) {
    var itemTitle = "";
    var itemDesc = "";
    var notiEnabled = false;
    showDialog(
        context: context,
        child: new AlertDialog(
          title: new Text("Add Item"),
          content: new Column(
            children: [
              new Row(
                children: <Widget>[
                  new Expanded(
                      child: new TextField(
                    autofocus: true,
                    decoration: new InputDecoration(
                        labelText: 'Item Name', hintText: 'eg. Call Mom.'),
                    onChanged: (value) {
                      itemTitle = value;
                    },
                  ))
                ],
              ),
              new Row(
                children: <Widget>[
                  new Expanded(
                      child: new TextField(
                    autofocus: true,
                    decoration: new InputDecoration(
                        labelText: 'Item Description',
                        hintText:
                            'eg. You need to call her because mothers day is coming up...'),
                    onChanged: (value) {
                      itemDesc = value;
                    },
                  ))
                ],
              ),
              new Row(
                children: <Widget>[
                  new Checkbox(
                    value: notiEnabled,
                    activeColor: Colors.black,
                    onChanged: (bool value) {
                      notiEnabled = !value;
                      setState(() {});
                    },
                  ),
                  new Text("Check to turn on notifications.")
                ],
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  theList.todoItems.add(new Item(itemTitle, itemDesc,
                      DateTime.now(), false, notiEnabled, DateTime.now()));
                  Navigator.pop(context);
                }),
            FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ));
  }

  stateChangeFunction() {
    setState(() {});
  }

  List<Item> sortItems(List<Item> items) {
    List<Item> sortedList = new List<Item>();
    int numberChecked = 0;
    for (Item i in items) {
      if (i.checked) {
        sortedList.add(i);
        numberChecked += 1;
      } else {
        sortedList.insert(0, i);
      }
    }
    List<Item> nonChecked = new List<Item>();
  }
}

class CheckListItem extends StatelessWidget {
  final Item todoItem;
  final Function checkedFunction;
  CheckListItem({@required this.todoItem, @required this.checkedFunction});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: new InkWell(
        child: Text(
          todoItem.name,
          style:
              new TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        onLongPress: () {
          _deleteItemPopup(context, todoItem);
        },
      ),
      leading: Checkbox(
        value: todoItem.checked,
        activeColor: Colors.black,
        onChanged: (bool value) {
          todoItem.checked = value;
          checkedFunction(value: value, currentValueRef: todoItem.checked);
        },
      ),
      trailing: todoItem.dueDate == null
          ? new Container()
          : new Text(todoItem.dueDate.toIso8601String()),
      subtitle:
          todoItem.notes == '' ? new Container() : new Text(todoItem.notes),
    );
  }

  void _deleteItemPopup(BuildContext context, Item item) {
    showDialog(
        context: context,
        child: new AlertDialog(
          title: new Text(
              "Are you sure you would like to delete " + item.name + "?"),
          actions: <Widget>[
            FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  for (TodoList list in lists) {
                    if (list.todoItems.contains(item)) {
                      list.todoItems.remove(item);
                      checkedFunction();
                      break;
                    }
                  }

                  Navigator.pop(context);
                }),
            FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ));
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
    new Item('I will not be shownable in mockup', '', new DateTime(2011), null,
        null, DateTime(2020)),
  ]),
];
