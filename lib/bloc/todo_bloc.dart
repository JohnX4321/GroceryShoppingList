import 'dart:async';
import 'package:bloc/bloc.dart';
import './index.dart';
import '../models/todo.dart';

class TodoBloc extends Bloc<TodoEvent,TodoState> {

  TodoBloc(): super(TodoLoading()) {
    on<LoadTodo>((event,emit)=>emit(TodoLoaded(const {'upcoming': [],'completed': []})));
    on<AddTodo>((event,emit) {
      var todoState=state as TodoLoaded;
      var todoMap=todoState.todos;
      var updatedUpcoming =[...?todoMap["upcoming"],event.groceryModel];
      emit(TodoLoaded({"upcoming": updatedUpcoming,"completed": todoMap["completed"]}));
    });
    on<CompleteTodo>((event,emit) {
      var todoState = state as TodoLoaded;
      var todoMap=todoState.todos;
      var completedTodo = GroceryModel(event.todo.id, event.todo.task, event.todo.path,event.todo.completed);
      var updatedUpcoming = todoMap["upcoming"]!.where((element) => element!=event.todo).toList();
      var updatedCompleted = [...todoMap["completed"]!,completedTodo];
      emit(TodoLoaded({"upcoming": updatedUpcoming,"completed": updatedCompleted}));
    });
  }

  @override
  Stream<TodoState> mapEventToState(TodoEvent event) async* {
    if (event is LoadTodo) {
      yield TodoLoaded(const {'upcoming': [],'completed': []});
    }
    if (event is AddTodo) {
      yield* _mapAddTodoToState(event);
    }
    if(event is CompleteTodo) {
      yield* _mapCompletedTodoToState(event);
    }
  }

  Stream<TodoState> _mapAddTodoToState(AddTodo event) async* {
    if(state is TodoLoaded) {
      var todoState=state as TodoLoaded;
      var todoMap=todoState.todos;
      var updatedUpcoming =[...?todoMap["upcoming"],event.groceryModel];
      yield (TodoLoaded({"upcoming": updatedUpcoming,"completed": todoMap["completed"]}));
    }
  }

  Stream<TodoState> _mapCompletedTodoToState(CompleteTodo event) async* {
    if(state is TodoLoaded) {
      var todoState = state as TodoLoaded;
      var todoMap=todoState.todos;
      var completedTodo = GroceryModel(event.todo.id, event.todo.task, event.todo.path,event.todo.completed);
      var updatedUpcoming = todoMap["upcoming"]!.where((element) => element!=event.todo).toList();
      var updatedCompleted = [...todoMap["completed"]!,completedTodo];
      yield (TodoLoaded({"upcoming": updatedUpcoming,"completed": updatedCompleted}));
    }
  }

}