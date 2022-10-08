part of 'joker_bloc.dart';

abstract class JokerState extends Equatable {
  const JokerState();
}

class JokerLoading extends JokerState {
  @override
  List<Object> get props => [];
}

class JokerLoaded extends JokerState {
  final JModel joke;

  JokerLoaded(this.joke);

  @override
  List<Object> get props => [];
}

class JokError extends JokerState {
  final String Error;

  JokError(this.Error);

  @override
  List<Object> get props => [];
}
