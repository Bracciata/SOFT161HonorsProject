import 'package:braccia_honors_project/classes/items.dart';

class TodoList {
  String name;
  List<Item> todoItems;
  TodoList(String name, List<Item> todoItems) {
    this.name = name;
    this.todoItems = todoItems;
  }
  void sort() {
    //Sort the items
  }
}
