// To parse this JSON data, do
//
//     final todo = todoFromJson(jsonString);

import 'dart:convert';

List<Todo> todoFromJson(String str) =>
    List<Todo>.from(json.decode(str).map((x) => Todo.fromJson(x)));

String todoToJson(List<Todo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Todo {
  int id;
  String todo;

  Todo({
    this.id,
    this.todo,
  });

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        id: json["id"],
        todo: json["todo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tod": todo,
      };
}
