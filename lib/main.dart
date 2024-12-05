import 'package:experimenting_bloc_app/bloc/image_picker/image_picker_bloc.dart';
import 'package:experimenting_bloc_app/bloc/switch_example/switch_bloc.dart';
import 'package:experimenting_bloc_app/bloc/to_do/to_do_bloc.dart';
import 'package:experimenting_bloc_app/ui/image_picker/image_picker_screen.dart';
import 'package:experimenting_bloc_app/ui/switch_example/switch_example_screen.dart';
import 'package:experimenting_bloc_app/ui/to_do/to_do_screen.dart';
import 'package:experimenting_bloc_app/utils/image_picker_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SwitchBloc()),
        BlocProvider(create: (_) => ImagePickerBloc(ImagePickerUtils())),
        BlocProvider(create: (_) => ToDoBloc()),
      ],
      child: MaterialApp(
        title: 'Example of multiple apps using Bloc',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const ToDoScreen(),
      ),
    );
  }
}
