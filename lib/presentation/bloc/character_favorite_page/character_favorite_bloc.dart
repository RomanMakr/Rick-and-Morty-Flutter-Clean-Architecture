import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/character_view_model.dart';
import 'character_favorite_event.dart';
import 'character_favorite_state.dart';

class CharacterFavoriteBloc
    extends Bloc<CharacterFavoriteEvent, CharacterFavoriteState> {
  final List<CharacterViewModel> _favorites = [];

  CharacterFavoriteBloc() : super(CharacterFavoriteInitial()) {
    on<LoadFavoriteCharacters>(_loadFavorites);
    on<ToggleFavoriteCharacter>(_toggleFavorite);
  }

  void _loadFavorites(
    LoadFavoriteCharacters event,
    Emitter<CharacterFavoriteState> emit,
  ) {
    emit(CharacterFavoriteLoading());
    emit(CharacterFavoriteLoaded(List.unmodifiable(_favorites)));
  }

  void _toggleFavorite(
    ToggleFavoriteCharacter event, 
    Emitter<CharacterFavoriteState> emit,
  ) {
    try {
      final index =
          _favorites.indexWhere((c) => c.id == event.character.id);

      if (index >= 0) {
        _favorites.removeAt(index);
      } else {
        _favorites.add(event.character);
      }

      emit(CharacterFavoriteLoaded(List.unmodifiable(_favorites)));
    } catch (e) {
      emit(CharacterFavoriteError(e.toString()));
    }
  }
}

