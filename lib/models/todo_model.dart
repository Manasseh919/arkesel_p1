class Todo {
  int? id;
  final String title;
  DateTime creationDate;
  bool isChecked;

  Todo({
    this.id,
    required this.title,
    required this.creationDate,
    required this.isChecked,
  });

  //to save this data in the database we need to convert it to a map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'creationDate': creationDate.toString(),
      'isChecked': isChecked ? 1 : 0,
    };
  }

  //this function is for debugging only
  @override
  String toString() {
    // TODO: implement toString
    return 'Todo(id:$id,title:$title,creationDate:$creationDate,ischecked:$isChecked)';
  }
}
