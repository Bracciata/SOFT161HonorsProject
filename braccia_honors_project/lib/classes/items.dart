class Item {
  String name;
  String notes;
  bool checked;
  bool notificationsEnabled;
  DateTime dueDate;
  DateTime dateAdded;


  Item(String name, String notes, bool checked, DateTime dueDate) {
    this.name = name;
    this.notes = notes;
    this.checked = checked;
    this.dueDate = dueDate;

    //notifications enabled by default
    this.notificationsEnabled= true;
    //date added will be today.
    this.dateAdded = DateTime.now();
  }
}
