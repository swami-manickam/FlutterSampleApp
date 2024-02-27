import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {

  final PageController pageController;

  TodoBloc() : super(TodoInitial()) {
    on<TodoEvent>((event, emit) {

    });
  }
}
