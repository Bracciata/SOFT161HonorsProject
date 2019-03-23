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
  final double collapsedHeight;
  final double expandedHeight;
  final Widget child;
  final String name;

  ExpandableListStatefulWidget(
      {@required this.child,
      this.collapsedHeight = 0.0,
      this.expandedHeight = 300.0,
      this.expanded = true,
      this.name = 'blank'});
  @override
  ExpandableList createState() => ExpandableList(
      expanded: this.expanded,
      expandedHeight: this.expandedHeight,
      child: this.child,
      name: this.name,
      collapsedHeight: this.collapsedHeight);
}

class ExpandableList extends State<ExpandableListStatefulWidget> {
  bool expanded;
  final double collapsedHeight;
  final double expandedHeight;
  final Widget child;
  final String name;

  ExpandableList(
      {@required this.child,
      @required this.collapsedHeight,
      @required this.expandedHeight,
      @required this.expanded,
      @required this.name});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return new Column(children: [
      GestureDetector(
          onTap: () {
            setState(() {
              expanded = !expanded;
              print('tapp');
            });
          },
          child: Row(
            children: [
              Expanded(
                  child: Text(
                name,
                style: new TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black),
              )),
              Expanded(
                  child: Text(
                expanded ? 'Λ' : 'V',
                textAlign: TextAlign.right,
                style: new TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black),
              ))
            ],
          )),
      AnimatedContainer(
        duration: new Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: screenWidth,
        height: expanded ? null : collapsedHeight,
        child: new Container(
          child: child,
        ),
      )
    ]);
  }
}

/*class CheckListItem extends StatelessWidget {
  final String text;
  final String checked;
  final String dueDate;
  final String dateAdded;
  final String notes;
}*/
