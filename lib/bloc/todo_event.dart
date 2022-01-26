import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../models/todo.dart';

@immutable
abstract class TodoEvent extends Equatable {
  var propsList;
  TodoEvent([List this.propsList = const []]): super();

  @override
  // TODO: implement props
  List<Object?> get props => propsList;
}

class LoadTodo extends TodoEvent {
  LoadTodo();

  @override
  String toString() {
    // TODO: implement toString
    return "LoadTodos";
  }
}

class AddTodo extends TodoEvent {
  final GroceryModel groceryModel;
  AddTodo(this.groceryModel): super([groceryModel]) {
    print(groceryModel.toString());
  }

  @override
  String toString() {
    // TODO: implement toString
    return "AddTodo";
  }
}

class CompleteTodo extends TodoEvent {
  final GroceryModel todo;
  CompleteTodo(this.todo): super([todo]);

  @override
  String toString() {
    // TODO: implement toString
    return "CompleteTodo";
  }

}

class DeleteTodo extends TodoEvent {
  final GroceryModel todo;
  DeleteTodo(this.todo): super([todo]);

  @override
  String toString() {
    return "DeleteTodo";
  }
}