class Item {
  String title;
  String notes;
  bool checked;
  DateTime dueDate;
  DateTime dateAdded;

  Item(String title, String notes, bool checked, DateTime dueDate,
      DateTime dateAdded) {
    this.title = title;
    this.notes = notes;
    this.checked = checked;
    this.dueDate = dueDate;
    this.dateAdded = dateAdded;
  }
}
