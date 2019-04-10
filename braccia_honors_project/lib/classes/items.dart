class Item {
  String name;
  String notes;
  bool checked;
  bool notificationsEnabled;
  DateTime dueDate;
  DateTime dateAdded;

  Item(String name, String notes, DateTime dueDate, bool checked,
      bool notificationsEnabled, DateTime dateAdded) {
    this.name = name;
    this.notes = notes;
    this.dueDate = dueDate;

    // Below is default values
    checked == null ? this.checked = false : this.checked = checked;

    notificationsEnabled == null
        ? this.notificationsEnabled = true
        : this.notificationsEnabled = notificationsEnabled;
    dateAdded == null
        ? this.dateAdded = DateTime.now()
        : this.dateAdded = dateAdded;
  }
}
