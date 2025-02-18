import 'package:blocstatemanagement/bloc/counter_bloc/counter_event.dart';
import 'package:blocstatemanagement/bloc/counter_bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState>{
  CounterBloc() : super(const CounterState()){
    on<IncrementCounter>(_increment);
    on<DecrementCounter>(_decrement);
  }

  void _increment(IncrementCounter event, Emitter<CounterState> emit){
    emit(state.copyWith(counter: state.counter + 1));
  }

  void _decrement(DecrementCounter event, Emitter<CounterState> emit){
    emit(state.copyWith(counter: state.counter - 1));
  }

}