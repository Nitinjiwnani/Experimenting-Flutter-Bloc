import 'package:experimenting_bloc_app/bloc/switch_example/switch_bloc.dart';
import 'package:experimenting_bloc_app/ui/switch_example/switch_example_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(providers: [
      BlocProvider(create: (_) => SwitchBloc()),
    ], child: MaterialApp(
      title: 'Example of multiple apps using Bloc',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SwitchExampleBloc(),
    ),);
  }
}
