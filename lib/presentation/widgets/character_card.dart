import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/character_favorite_page/character_favorite_bloc.dart';
import '../bloc/character_favorite_page/character_favorite_event.dart';
import '../models/character_view_model.dart';

class CharacterCard extends StatelessWidget {
  final CharacterViewModel character;
  final bool enableFavoriteToggle;

  const CharacterCard({
    super.key,
    required this.character,
    this.enableFavoriteToggle = true,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      color: const Color.fromARGB(255, 83, 83, 83),
      child: ListTile(
        leading: Image.network(character.image, width: 50),
        title: Text(
          character.name,
          style: const TextStyle(
            color: Color.fromARGB(255, 190, 182, 182),
            fontWeight: FontWeight.bold,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          '${character.species} • ${character.status}',
          style: const TextStyle(color: Colors.white),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(character.genderIcon, color: character.genderColor, size: 30),
            const SizedBox(width: 8),
            IconButton(
              icon: Icon(
                character.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: Colors.white,
              ),
              onPressed: enableFavoriteToggle
                  ? () {
                      character.isFavorite = !character.isFavorite;

                      context.read<CharacterFavoriteBloc>().add(
                        ToggleFavoriteCharacter(character),
                      );
                    }
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
