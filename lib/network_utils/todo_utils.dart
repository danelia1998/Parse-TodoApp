import 'dart:convert';

import 'package:http/http.dart';
import 'package:todo_app/model/todo.dart';

class TodoUtils {
  static final String _baseUrl = "http://10.0.2.2:8080/";

  static Future<Response> addTodo(Todo todo) async {
    String apiUrl = _baseUrl + "add-todo";

    Response response = await post(
      apiUrl,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(todo.toJson()),
    );

    return response;
  }

  static Future getTodoList() async {
    String apiUrl = _baseUrl + "todos";

    Response response =
        await get(apiUrl, headers: {'Content-Type': 'application/json'});
    print(response);
    return response;
  }

  static Future updateTodo(Todo todo) async {
    String apiUrl = _baseUrl + "update-todo/${todo.id}";

    Response response = await put(apiUrl,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(todo.toJson()));

    return response;
  }

  static Future deleteTodo(String id) async {
    String apiUrl = _baseUrl + "delete-todo/$id";

    Response response =
        await delete(apiUrl, headers: {'Content-Type': 'application/json'});

    return response;
  }
}
