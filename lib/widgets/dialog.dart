import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../models/todo.dart';
import '../bloc/index.dart';

class GroceryDialog extends StatelessWidget {

  final textEditingController = TextEditingController();
  final Uuid _uuid = Uuid();

  @override
  Widget build(BuildContext context) {
    final TodoBloc _todoBloc = BlocProvider.of(context);

    return SimpleDialog(
      title: const Text("Enter Grocery Item"),
      children: [
        Padding(padding: EdgeInsets.all(20),child: TextField(controller: textEditingController,),),
        ButtonBar(children: [
          ElevatedButton(onPressed: ()=>Navigator.of(context,rootNavigator: true).pop(), child: const Icon(Icons.close)),
          ElevatedButton(onPressed: () {
            GroceryModel _grocery=GroceryModel(_uuid.v1(), textEditingController.text, "", false);
            _todoBloc.add(AddTodo(_grocery));
            Navigator.of(context,rootNavigator: true).pop();
          }, child: const Icon(Icons.add))
        ],)
      ],
    );
  }

}