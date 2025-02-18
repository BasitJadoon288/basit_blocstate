import 'package:equatable/equatable.dart';

class ToDoState extends Equatable{

  final List<String> todoList;
  const ToDoState({
    this.todoList = const []
});

  ToDoState copyWith({List<String>? todoList}){
    return ToDoState(
      todoList: todoList ?? this.todoList
    );
}

  @override
  // TODO: implement props
  List<Object?> get props => [todoList];


}