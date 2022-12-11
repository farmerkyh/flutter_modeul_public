/*
  - class로 만들시 장점
    . ..
*/
import 'package:flutter/cupertino.dart';
import 'package:todo_udemy/todo_step1/models/todo_model.dart';

class TodoFilterState {
  final Filter filter;

  TodoFilterState({required this.filter});

  factory TodoFilterState.initial() {
    return TodoFilterState(filter: Filter.all);
  }

  @override
  List<Object> get props => [filter];

  @override
  bool get stringfy => true;

  TodoFilterState copyWith({
    Filter? filter,
  }) {
    return TodoFilterState(filter: filter ?? this.filter);
  }
}

/*
  @ All, Active, Complete Tab 누를때마다 호출 됨
*/
class TodoFilter with ChangeNotifier {
  TodoFilterState _state = TodoFilterState.initial();
  TodoFilterState get state => _state;

  void changeFilter(Filter newFilter) {
    _state = _state.copyWith(filter: newFilter);
    notifyListeners();
  }
}
