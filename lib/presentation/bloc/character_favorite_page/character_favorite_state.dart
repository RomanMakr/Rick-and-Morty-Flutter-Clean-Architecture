import '../../models/character_view_model.dart';

abstract class CharacterFavoriteState {}
class CharacterFavoriteInitial extends CharacterFavoriteState {}
class CharacterFavoriteLoading extends CharacterFavoriteState {}
class CharacterFavoriteLoaded extends CharacterFavoriteState {
  final List<CharacterViewModel> favoriteCharacters;

  CharacterFavoriteLoaded(this.favoriteCharacters);
}
class CharacterFavoriteError extends CharacterFavoriteState {
  final String message;

  CharacterFavoriteError(this.message);
}