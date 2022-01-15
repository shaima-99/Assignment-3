// TODO Complete the service class, TodoService
//-----------------------------------------------------------------------------------------------------------------------------
//? Things to do:
//   Define the following methods to handle REST calls about the Todo data
//    to the REST service.
//       a. getTodoListByUser: to get all the todos for a user (with given user id).
//       b. addTodo: to add a new todo.
//       c. updateTodo: to edit a todo.
//       d. removeTodo: to delete a todo
//-----------------------------------------------------------------------------------------------------------------------------

import 'dart:convert';

import 'rest.dart';
import '../models/todo.dart';

class TodoService {
  static Future<List<Todo>> getTodoListByUser(int userId) async {
    final listJson = await Rest.get('todos?user=$userId');
    return listJson.map<Todo>((json) => Todo.fromJson (json)).toList();
  }

  static Future<Todo> addTodo(Todo todo) async {
    final json = await Rest.post('todos', data: todo);
    return Todo.fromJson(json);
  }

  static Future<Todo> updateTodo(Todo todo) async {
    int id = todo.id;
    final json = await Rest.put('todos/$id', data: todo);
    return Todo.fromJson(json);
  }

  static Future<void> removeTodo(Todo todo) async {
    int id = todo.id;
    Rest.delete('todos/$id');
  }
}
