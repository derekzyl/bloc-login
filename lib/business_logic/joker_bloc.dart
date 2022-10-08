import 'package:bloc/bloc.dart';
import 'package:bloctest/model.dart';
import 'package:equatable/equatable.dart';

part 'joker_event.dart';
part 'joker_state.dart';

class JokerBloc extends Bloc<JokerEvent, JokerState> {
  final jRepo _repo;
  JokerBloc(this._repo) : super((JokerLoading())) {
    on<LoadJokeEvent>((event, emit) async {
      emit(JokerLoading());

      try {
        final a = await _repo.getJokr();
        emit(JokerLoaded(a));
      } catch (e) {
        emit(JokError('$e'));
      }
    });
  }
  @override
  void onChange(Change<JokerState> change) {
    super.onChange(change);
    print(change);
  }

  // @override
  // void onTransition(Transition<LoadJokeEvent, JokerState> transition) {
  //   super.onTransition(transition);
  //   print(transition);
  // }
}
