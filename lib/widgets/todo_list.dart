import 'package:arkesel_todo/models/db_model.dart';
import 'package:arkesel_todo/widgets/todo_card.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TodoList extends StatelessWidget {
  //create an object of database connect
  final Function deleteFunction;
  final Function insertFunction;
  var db = DatabaseConnect();
  TodoList(
      {required this.insertFunction, required this.deleteFunction, super.key});

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
                ? const Center(
                    child: Text('no data found'),
                  )
                : ListView.builder(
                    itemCount: datalength,
                    itemBuilder: (context, i) => TodoCard(
                        id: data[i].id,
                        title: data[i].title,
                        creationDate: data[i].creationDate,
                        isChecked: data[i].isChecked,
                        insertFuntion: insertFunction,
                        deleteFunction: deleteFunction),
                  );
          }),
    );
  }
}
