import '../../models/character_view_model.dart';

abstract class CharacterState {}

class CharacterInitial extends CharacterState {}

class CharacterLoading extends CharacterState {}

class CharacterLoaded extends CharacterState {
  final List<CharacterViewModel> characters;

  CharacterLoaded(this.characters);
}

class CharacterError extends CharacterState {
  final String message;

  CharacterError(this.message);
}
