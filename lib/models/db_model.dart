import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import './todo_model.dart';

class DatabaseConnect {
  Database? _database;

  //create database and open connection
  Future<Database> get database async {
    //this is the location of the database

    final dbpath = await getDatabasesPath();
    //this is the name of the database
    const dbname = 'todo.db';

//this joins the dbpath and dbname and creates a full path for the database.
    final path = join(dbpath, dbname);

    //open the connection
    _database = await openDatabase(path, version: 1, onCreate: _createDB);

    return _database!;
  }

  //the _create db function
  /* this creates the table in the database */
  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE todo(id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT,
    creationDate TEXT,
    isChecked INTEGER
    
    )
''');
  }

  //funtion to add data into the database
  Future<void> insertTodo(Todo todo) async {
    //connection to database
    final db = await database;

    await db.insert(
        'todo', //the name of the table
        todo.toMap(), //the function I created in the todo model
        conflictAlgorithm:
            ConflictAlgorithm.replace //this will replace duplicate entries
        );
  }

  //function to delete a todo from the database
  Future<void> deleteTodo(Todo todo) async {
    final db = await database;

    //delete the todo from the database based on the id
    await db.delete('todo', where: 'id == ?', whereArgs: [todo.id]);
  }

  //function to fetch all the todo data from the database
  Future<List<Todo>> getTodo() async {
    final db = await database;
    //get the database and save the todo as a list f maps
    List<Map<String, dynamic>> items = await db.query(
      'todo',
      orderBy: 'id DESC', /* This will order the list by ID */
    );
    return List.generate(
        items.length,
        (i) => Todo(
            id: items[i]['id'],
            title: items[i]['title'],
            creationDate: DateTime.parse(items[i]['creationDate']), // this will convert it to datetime format
            isChecked: items[i]['isChecked'] == 1 ? true : false));
  }
}
