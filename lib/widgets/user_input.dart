import 'package:arkesel_todo/models/todo_model.dart';
import 'package:flutter/material.dart';

class UserInput extends StatelessWidget {
  UserInput({required this.insertFunction, super.key});

  var textController = TextEditingController();
  final Function insertFunction; // this will receive the add function item

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFDAB5FF),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: TextField(
                controller: textController,
                decoration: InputDecoration(
                    hintText: "add new todos", border: InputBorder.none),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              //create todo
              var myTodo = Todo(
                  title: textController.text,
                  creationDate: DateTime.now(),
                  isChecked: false);
              insertFunction(myTodo);
            },
            child: Container(
              color: Colors.red,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: const Text(
                "add",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
