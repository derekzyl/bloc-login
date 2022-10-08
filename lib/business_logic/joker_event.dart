part of 'joker_bloc.dart';

abstract class JokerEvent extends Equatable {
  const JokerEvent();
}

class LoadJokeEvent extends JokerEvent {
  List<Object> get props => [];
}
