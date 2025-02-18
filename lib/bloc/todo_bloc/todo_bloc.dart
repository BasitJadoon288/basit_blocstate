import 'package:bloc/bloc.dart';
import 'package:blocstatemanagement/bloc/todo_bloc/todo_event.dart';
import 'package:blocstatemanagement/bloc/todo_bloc/todo_state.dart';

class ToDoBloc extends Bloc<ToDoEvent, ToDoState>{

  final List<String> todoList =[];
  ToDoBloc() : super(const ToDoState()){
    on<AddToDoEvent>(_addtodoEvent);
    on<RemoveToDoEvent>(_removetodoEvent);
  }
  void _addtodoEvent(AddToDoEvent event, Emitter<ToDoState> emit){

    todoList.add(event.task);
    emit(state.copyWith(todoList: List.from(todoList)));
  }

  void _removetodoEvent(RemoveToDoEvent event, Emitter<ToDoState> emit){

    todoList.remove(event.task);
    emit(state.copyWith(todoList: List.from(todoList)));
  }
}