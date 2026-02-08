import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_list/bloc/grocery_bloc.dart';
import 'package:grocery_list/screens/home_screen.dart';
import 'package:grocery_list/theme/app_theme.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(const GroceryApp());
}

// Simple Bloc Observer to track state changes
class SimpleBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
  }
}

class GroceryApp extends StatelessWidget {
  const GroceryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GroceryBloc(),
      child: MaterialApp(
        title: 'Grocery List',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: const HomeScreen(),
      ),
    );
  }
}
