import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/todo.dart';
import '../bloc/index.dart';

class GroceryCard extends StatelessWidget {

  final GroceryModel todo;
  GroceryCard(this.todo);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    bool completed = todo.completed;
    final TodoBloc _todoBloc = BlocProvider.of(context);

    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Icon(completed?Icons.check_circle:Icons.assignment,),
            title: Text(todo.task,style: TextStyle(decoration: null),),
            subtitle: const Text(""),
          ),
          completed?Container():
              ButtonBarTheme(data: ButtonBarThemeData(),child: ButtonBar(
                children: [
                  TextButton(onPressed: () {
                    showModalBottomSheet(context: context, builder: (BuildContext context) {
                      return Container(
                        height: 200,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text("Yet To Implement")
                            ],
                          ),
                        ),
                      );
                    });
                  }, child: const Text("View"),),
                  if(!todo.completed)
                    TextButton(
                        onPressed: () {
                          todo.completed=true;
                          _todoBloc.add(CompleteTodo(todo));
                        },
                        child: const Text("Completed"))
                  else
                    ElevatedButton(onPressed: ()=>{}, child: const Icon(Icons.delete)),
                ],
              ))
        ],
      ),
    );

  }

}