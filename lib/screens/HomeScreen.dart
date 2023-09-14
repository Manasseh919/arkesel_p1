import 'package:arkesel_todo/widgets/todo_card.dart';
import 'package:arkesel_todo/widgets/todo_list.dart';
import 'package:arkesel_todo/widgets/user_input.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF5EBFF),
      appBar: AppBar(
        title: const Text("Simple Todo App"),
      ),
      body: Column(
        children: [
          //this is where all the widgets are
         TodoList(),

          UserInput(),
        ],
      ),
    );
  }
}
