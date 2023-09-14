import 'package:arkesel_todo/models/db_model.dart';
import 'package:arkesel_todo/widgets/todo_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TodoList extends StatelessWidget {
  //create an object of database connect
  var db = DatabaseConnect();
  TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
          future: db.getTodo(),
          initialData: const [],
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            var data = snapshot.data; //this is the data that has show
            var datalength = data!.length;

            return datalength == 0
                ? Center(
                    child: Text('no data found'),
                  )
                : ListView.builder(
                    itemCount: datalength,
                    itemBuilder: (context, i) => TodoCard(
                        id: data[i].id,
                        title: data[i].title,
                        creationDate: data[i].creationDate,
                        isChecked: data[i].isChecked,
                        insertFuntion: () {},
                        deleteFunction: () {}));
          }),
    );
  }
}
