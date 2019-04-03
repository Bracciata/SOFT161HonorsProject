class Item {
  String name;
  String notes;
  bool checked;
  DateTime dueDate;
  DateTime dateAdded;

  Item(String name, String notes, bool checked, DateTime dueDate,
      DateTime dateAdded) {
    this.name = name;
    this.notes = notes;
    this.checked = checked;
    this.dueDate = dueDate;
    this.dateAdded = dateAdded;
  }
}
