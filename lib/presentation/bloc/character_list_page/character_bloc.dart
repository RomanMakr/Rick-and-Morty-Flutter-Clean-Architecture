import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorti_clean_architecture/domain/repository/character_repository.dart';
import 'character_event.dart';
import 'character_state.dart';
import '../../models/character_view_model.dart';

class CharacterListBloc extends Bloc<CharacterEvent, CharacterState> {
  final CharacterRepository repository;

  CharacterListBloc({required this.repository}) : super(CharacterInitial()) {
    on<LoadCharacters>(_load);
    on<ToggleFavorite>(_toggleFavorite);
  }

  Future<void> _load(LoadCharacters event, Emitter<CharacterState> emit) async {
    emit(CharacterLoading());
    try {
      final data = await repository.getCharacters();

      final List<CharacterViewModel> viewModels = [];
      for (var character in data) {
        viewModels.add(CharacterViewModel.fromEntity(character));
      }

      emit(CharacterLoaded(viewModels));
    } catch (e) {
      emit(CharacterError(e.toString()));
    }
  }

  void _toggleFavorite(ToggleFavorite event, Emitter<CharacterState> emit) {
    final state = this.state;
    if (state is! CharacterLoaded) return;

    for (var character in state.characters) {
      if (character.id == event.characterId) {
        character.isFavorite = !character.isFavorite;
        break;
      }
    }

    emit(CharacterLoaded(List.from(state.characters)));
  }
}
