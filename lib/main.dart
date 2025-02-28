import 'package:blocstatemanagement/bloc/counter_bloc/counter_bloc.dart';
import 'package:blocstatemanagement/bloc/login_bloc/login_bloc.dart';
import 'package:blocstatemanagement/bloc/todo_bloc/todo_bloc.dart';
import 'package:blocstatemanagement/ui/counter_screen.dart';
import 'package:blocstatemanagement/ui/login/login_screen.dart';
import 'package:blocstatemanagement/ui/todo/todo_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/home_bloc/home_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterBloc()),
        BlocProvider(create: (_) => ToDoBloc()),
        BlocProvider(create: (_) => LoginBloc()),
        BlocProvider(create: (_) => ProductBloc()),

    ],
      child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
      )
    );

  }
}

