import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/character_favorite_page/character_favorite_bloc.dart';
import '../bloc/character_favorite_page/character_favorite_state.dart';
import '../bloc/character_list_page/character_bloc.dart';
import '../bloc/character_list_page/character_state.dart';
import '../widgets/character_card.dart';


class CharacterList extends StatelessWidget {
  const CharacterList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterListBloc, CharacterState>(
      builder: (context, characterState) {
        if (characterState is! CharacterLoaded) {
          return const Center(child: CircularProgressIndicator());
        }

        return BlocBuilder<CharacterFavoriteBloc, CharacterFavoriteState>(
          builder: (context, favoriteState) {
            final favoriteIds = favoriteState is CharacterFavoriteLoaded
                ? favoriteState.favoriteCharacters.map((c) => c.id).toSet()
                : <int>{};

            for (var character in characterState.characters) {
              character.isFavorite = favoriteIds.contains(character.id);
            }

            return ListView.builder(
              itemCount: characterState.characters.length,
              itemBuilder: (_, index) {
                return CharacterCard(
                  character: characterState.characters[index],
                );
              },
            );
          },
        );
      },
    );
  }
}

