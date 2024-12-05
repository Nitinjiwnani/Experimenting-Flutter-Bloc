import 'package:equatable/equatable.dart';

abstract class ToDoEvent extends Equatable {
  const ToDoEvent();
}

class AddToDoEvent extends ToDoEvent {
  final String task;
  const AddToDoEvent({required this.task});

  @override
  List<Object?> get props => [task];
}

class DeleteToDoEvent extends ToDoEvent {
  final Object task;
  const DeleteToDoEvent(this.task);

  @override
  List<Object?> get props => [task];
}
