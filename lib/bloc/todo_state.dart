import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../models/todo.dart';

@immutable
abstract class TodoState extends Equatable {
  var propsList;

  TodoState([this.propsList=const []]): super();

  @override
  // TODO: implement props
  List<Object?> get props => propsList;
}

class TodoLoading extends TodoState {
  @override
  String toString() {
    // TODO: implement toString
    return "TodosLoading";
  }

}

class TodoLoaded extends TodoState {
  final Map<String,List<GroceryModel>> todos={};
  TodoLoaded([todos]): super([todos]);

  @override
  String toString() {
    // TODO: implement toString
    return "TodosLoaded {Todos: $todos}";
  }

}

class TodoNotLoaded extends TodoState {
  @override
  String toString() {
    // TODO: implement toString
    return "TodosNotLoaded";
  }


}