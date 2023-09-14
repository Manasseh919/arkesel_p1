import 'package:arkesel_todo/models/todo_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TodoCard extends StatefulWidget {
  final int id;
  final String title;
  final DateTime creationDate;
  bool isChecked;
  final Function insertFuntion;
  final Function deleteFunction;

  TodoCard(
      {required this.id,
      required this.title,
      required this.creationDate,
      required this.isChecked,
      required this.insertFuntion, // it will handle the changes in the checkboz
      required this.deleteFunction, // it will handle the delete button
      super.key});

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  @override
  Widget build(BuildContext context) {
    var anotherTodo = Todo(
        id: widget.id,
        title: widget.title,
        creationDate: widget.creationDate,
        isChecked: widget.isChecked);
    return Card(
      child: Row(
        children: [
          //this is the checkbox
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Checkbox(
              value: widget.isChecked,
              onChanged: (bool? value) {
                setState(() {
                  widget.isChecked = value!;
                });
                anotherTodo.isChecked = value!;

                widget.insertFuntion(anotherTodo);
              },
            ),
          ),
          //this is the title and date
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  widget.creationDate.toString(),
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF8F8F8F)),
                ),
              ],
            ),
          ),
          //this is the delete button
          IconButton(
              onPressed: ()=>widget.deleteFunction(anotherTodo),
              icon: const Icon(Icons.delete))
        ],
      ),
    );
  }
}
