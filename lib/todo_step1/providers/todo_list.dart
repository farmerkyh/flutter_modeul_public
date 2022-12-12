import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../models/todo_model.dart';

class TodoListState extends Equatable {
  final List<Todo> todos;
  TodoListState({
    required this.todos,
  });

  factory TodoListState.initial() {
    return TodoListState(todos: [
      Todo(id: '1', desc: 'Clean the room'),
      Todo(id: '2', desc: 'Wash the dish'),
      Todo(id: '3', desc: 'Do homework'),
    ]);
  }

  @override
  List<Object> get props => [todos];

  @override
  bool get stringify => true;

  TodoListState copyWith({
    List<Todo>? todos,
  }) {
    return TodoListState(
      todos: todos ?? this.todos,
    );
  }
}

class TodoList with ChangeNotifier {
  TodoListState _state = TodoListState.initial();
  TodoListState get state => _state;

  void addTodo(String todoDesc) {
    final newTodo = Todo(desc: todoDesc);
    final newTodos = [..._state.todos, newTodo];

    _state = _state.copyWith(todos: newTodos);
    print(_state);
    notifyListeners();
  }

  void editTodo(String id, String todoDesc) {
    final newTodos = _state.todos.map((Todo todo) {
      if (todo.id == id) {
        return Todo(
          id: id,
          desc: todoDesc,
          completed: todo.completed,
        );
      }
      return todo;
    }).toList();

    _state = _state.copyWith(todos: newTodos);
    notifyListeners();
  }

  //todo 완료여부 toggle처리용
  void toggleTodo(String id) {
    final newTodos = _state.todos.map((Todo todo) {
      if (todo.id == id) {
        return Todo(
          id: id,
          desc: todo.desc,
          completed: !todo.completed,
        );
      }
      return todo;
    }).toList();

    _state = _state.copyWith(todos: newTodos);
    notifyListeners();
  }

  //todo 삭제
  void removeTodo(Todo todo) {
    final newTodos = _state.todos.where((Todo t) => t.id != todo.id).toList();

    _state = _state.copyWith(todos: newTodos);
    notifyListeners();
  }
}
