import 'package:bloc/bloc.dart';
import 'package:experimenting_bloc_app/bloc/to_do/to_do_event.dart';
import 'package:experimenting_bloc_app/bloc/to_do/to_do_state.dart';

class ToDoBloc extends Bloc<ToDoEvent, ToDoState> {
  final List<String> toDoList = [];
  ToDoBloc() : super(const ToDoState()) {
    on<AddToDoEvent>(_addToDoEvent);
    on<DeleteToDoEvent>(_deleteToDoEvent);
  }

  void _addToDoEvent(AddToDoEvent event, Emitter<ToDoState> emit) {
    toDoList.add(event.task);
    emit(state.copywith(toDoList: List.from(toDoList)));
  }

  void _deleteToDoEvent(DeleteToDoEvent event, Emitter<ToDoState> emit) {
    toDoList.remove(event.task);
    emit(state.copywith(toDoList: List.from(toDoList)));
  }
}
