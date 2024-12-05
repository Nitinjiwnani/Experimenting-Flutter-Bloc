import 'package:experimenting_bloc_app/bloc/switch_example/switch_bloc.dart';
import 'package:experimenting_bloc_app/bloc/switch_example/switch_event.dart';
import 'package:experimenting_bloc_app/bloc/switch_example/switch_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchExampleBloc extends StatefulWidget {
  const SwitchExampleBloc({super.key});

  @override
  State<SwitchExampleBloc> createState() => _SwitchExampleBlocState();
}

class _SwitchExampleBlocState extends State<SwitchExampleBloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Switch Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Switch 1'),
                BlocBuilder<SwitchBloc, SwitchStates>(
                  buildWhen: (previous, current) => previous.isSwitch != current.isSwitch,
                    builder: (context, state) {
                  return Switch(
                    value: state.isSwitch,
                    onChanged: (value) {
                      context
                          .read<SwitchBloc>()
                          .add(EnableOrDisableNotification());
                    },
                  );
                }),
              ],
            ),
            const SizedBox(height: 30),
            BlocBuilder<SwitchBloc, SwitchStates>(
              buildWhen: (previous, current) => previous.slider != current.slider,
              builder: (context, state) {
              return Container(
              height: 200,
              color: Colors.red.withOpacity(state.slider),
            );
            }),
            
            const SizedBox(
              height: 60,
            ),
            BlocBuilder<SwitchBloc, SwitchStates>(
              
              builder: (context, state) {
              return Slider(
                value: state.slider,
                onChanged: (value) {
                  context.read<SwitchBloc>().add(SliderEvent(slider: value));
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
