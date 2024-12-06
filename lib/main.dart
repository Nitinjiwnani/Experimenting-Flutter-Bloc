import 'package:experimenting_bloc_app/bloc/favourite_app/favourite_app_bloc.dart';
import 'package:experimenting_bloc_app/bloc/image_picker/image_picker_bloc.dart';
import 'package:experimenting_bloc_app/bloc/switch_example/switch_bloc.dart';
import 'package:experimenting_bloc_app/bloc/to_do/to_do_bloc.dart';
import 'package:experimenting_bloc_app/repository/favourite_repository.dart';
import 'package:experimenting_bloc_app/ui/favourite_app/favourite_screen.dart';
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
        BlocProvider(create: (_) => FavouriteAppBloc(FavouriteRepository())),
      ],
      child: MaterialApp(
        title: 'Example of multiple apps using Bloc',
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          brightness: Brightness.dark,
          useMaterial3: true,
        ),
        home: const FavouriteAppScreen(),
      ),
    );
  }
}
