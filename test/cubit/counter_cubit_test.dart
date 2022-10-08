import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counterVal: 0,wasIncrease: false));

  void increase () => emit(CounterState(counterVal: state.counterVal +1, wasIncrease: true));
  void decrease () => emit(CounterState(counterVal: state.counterVal -1, wasIncrease: false));

}
