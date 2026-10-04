import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorti_clean_architecture/data/datasource/character_remote_datasource_impl.dart';
import 'package:rickandmorti_clean_architecture/data/repositories/character_repository_impl.dart';
import 'package:rickandmorti_clean_architecture/presentation/bloc/character_favorite_page/character_favorite_bloc.dart';
import 'package:rickandmorti_clean_architecture/presentation/bloc/character_favorite_page/character_favorite_event.dart';
import 'package:rickandmorti_clean_architecture/presentation/bloc/character_list_page/character_bloc.dart';
import 'package:rickandmorti_clean_architecture/presentation/bloc/character_list_page/character_event.dart';
import 'package:rickandmorti_clean_architecture/presentation/router/character_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CharacterListBloc(
            repository: CharacterRepositoryImpl(
              CharacterRemoteDataSourceImpl(),
            ),
          )..add(LoadCharacters()),
        ),
        BlocProvider(
          create: (_) =>
              CharacterFavoriteBloc()..add(LoadFavoriteCharacters()),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter.config(),
      ),
    );
  }
}
