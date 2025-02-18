import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class CounterEvent extends Equatable{

  const CounterEvent();
  @override
  List<Object> get props => [];
}

class IncrementCounter extends CounterEvent{}

class DecrementCounter extends CounterEvent{}

