import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/bloc/counter_event.dart';
import 'package:flutter_application_1/bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState(0)) {
    on<IncrementEvent>((e, emit) => emit(CounterState(state.count + 1)));
    on<DecrementEvent>((e, emit) => emit(CounterState(state.count - 1)));
  }
}
