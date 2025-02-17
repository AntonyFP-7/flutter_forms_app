import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<CounterIncreased>(_onCounterIncreased);
    //on<CounterIncreased>((event, emit)=>_OnCounterIncreased(event, emit));
    on<CounterReset>(_onCounterResed);
  }
  void _onCounterIncreased(CounterIncreased event, Emitter<CounterState> emit) {
    emit(state.copyWith(
      counter: state.counter + event.value,
      transactionCount: state.transactionCount + 1,
    ));
  }

  void _onCounterResed(CounterReset event, Emitter<CounterState> emit) {
    emit(state.copyWith(
      counter: 0,
    ));
  }

  void increaseBy([int value = 1]) {
    add(CounterIncreased(value: value));
  }

  void resetCounter() {
    add(CounterReset());
  }
}
