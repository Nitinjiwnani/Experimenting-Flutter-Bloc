import 'package:bloc/bloc.dart';
import 'package:experimenting_bloc_app/bloc/switch_example/switch_event.dart';
import 'package:experimenting_bloc_app/bloc/switch_example/switch_states.dart';
import 'package:flutter/material.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchStates>{
  SwitchBloc(): super(SwitchStates()){
    on<EnableOrDisableNotification>(_enableOrDisableNotification);
    on<SliderEvent>(_slider);
  }

  void _enableOrDisableNotification(EnableOrDisableNotification events, Emitter<SwitchStates> emit){
    emit(state.copywith(isSwitch: !state.isSwitch));
  }

  void _slider(SliderEvent events, Emitter<SwitchStates> emit){
    emit(state.copywith(slider: events.slider));
  }

}