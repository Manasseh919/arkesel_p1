import 'package:arkesel_todo/screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import './models/todo_model.dart';
import './models/db_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var db = DatabaseConnect();
  //inserting a sample todo data
  await db.insertTodo(Todo(
      id: 1,
      title: "this is a sample todo",
      creationDate: DateTime.now(),
      isChecked: false));

  print(await db.getTodo());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
