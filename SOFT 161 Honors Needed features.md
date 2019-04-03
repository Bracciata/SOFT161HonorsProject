The application you will be creating needs the following features

* It needs to be able to create multiple lists

    * An example of this would be one for school, one for work, and one for a club you participate in.

    * The lists will be sorted alphabetically

* Within each list, it needs the following features:

    * The ability to add items.

        * There should be no limit on the number of items added.

    * The ability to remove items.

    * The ability to name the list.

        * You should not be allowed two lists with the same name.

    * The ability to delete the list.

    * The ability to rename the list.

    * The items in the list will be sorted by checked items at the bottom, items with due dates at the top and they are sorted by the due date, and then items in between without due dates that will be sorted by when they were added.

* Within each item, it needs the following features:

    * The ability to name the item.

        * You should be able to have two items with the same name.

            * This is important because maybe you set up all physics homework with the same name but different times for due dates.

    * The ability to add a due date.

        * This needs to be an optional field 

    * The ability to add or at least turn on notifications.

        * This would let you be reminded the day before due by default.

        * You need to also allow an alternative time for a notification reminder.

    * The ability to add a description.

    * The ability to change the name.

    * The ability to change description.

        * This will be textual only.

    * Note, all fields will be textual only.

* The database must include the following features:

    * Must have multiple tables.

    * Must have proper naming conventions.

    * Must have a properly designed UML database diagram.

    * The tables must have all the of the necessary fields.

        * This would include name, due date, description, date created, and whether or not notifications are enabled.

        * The list would need the list’s name, creation date, and a relationship for the children.

