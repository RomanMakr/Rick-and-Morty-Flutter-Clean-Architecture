import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/character_favorite_page/character_favorite_bloc.dart';
import '../bloc/character_favorite_page/character_favorite_state.dart';
import '../widgets/character_card.dart';


class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CharacterFavoriteBloc, CharacterFavoriteState>(
        builder: (context, state) {
          if (state is CharacterFavoriteLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is CharacterFavoriteLoaded) {
            if (state.favoriteCharacters.isEmpty) {
              return const Center(child: Text('No favorites yet'));
            }

            return ListView.builder(
              itemCount: state.favoriteCharacters.length,
              itemBuilder: (_, index) {
                return CharacterCard(
                  character: state.favoriteCharacters[index],
                  enableFavoriteToggle: true, // read-only
                );
              },
            );
          }

          if (state is CharacterFavoriteError) {
            return Center(child: Text(state.message));
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
