import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/todo.dart';
import '../bloc/index.dart';
import '../widgets/dialog.dart';
import '../widgets/card.dart';

class MainScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final TodoBloc _todoBloc = BlocProvider.of(context);
    _todoBloc.add(LoadTodo());

    return Scaffold(
      appBar: AppBar(title: Text("Grocery List"),),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Text("Incomplete",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
            BlocBuilder(bloc: _todoBloc,builder: (BuildContext context, TodoState state) {
              if (state is TodoLoaded) {
                List<GroceryModel> upcomingTodos = state.todos["upcoming"]!;
                return Column(
                  children: upcomingTodos.map((m) => GroceryCard(m)).toList(),
                );
              } else return Container();
            }),
            Padding(padding: EdgeInsets.only(top: 40.0),child: Text("Completed",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),textAlign: TextAlign.center,),),
            BlocBuilder(bloc: _todoBloc,builder: (BuildContext context, TodoState state) {
              if (state is TodoLoaded) {
                List<GroceryModel> completedTodos = state.todos["completed"]!;
                return Column(
                  children: completedTodos.map((e) => GroceryCard(e)).toList(),
                );
              } else {
                return Container();
              }
            })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>showDialog(context: context, builder: (_)=>GroceryDialog()),
        tooltip: "Add",
        child: Icon(Icons.add),
      ),
    );

  }

}
