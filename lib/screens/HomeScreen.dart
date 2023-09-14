import 'package:arkesel_todo/models/db_model.dart';
import 'package:arkesel_todo/models/todo_model.dart';
import 'package:arkesel_todo/widgets/todo_card.dart';
import 'package:arkesel_todo/widgets/todo_list.dart';
import 'package:arkesel_todo/widgets/user_input.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //databse object to access database

  var db = DatabaseConnect();

  //function to add todo
  void addItem(Todo todo) async {
    await db.insertTodo(todo);
    setState(() {});
  }

  //function to delete todo
  void deleteItem(Todo todo) async {
    await db.deleteTodo(todo);
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Simple Todo App"),
      ),
      body: Column(
        children: [
          //this is where all the widgets are
          TodoList(insertFunction: addItem,deleteFunction: deleteItem,),

          UserInput(insertFunction: addItem,),
        ],
      ),
    );
  }
}
