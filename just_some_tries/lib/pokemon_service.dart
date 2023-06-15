import 'package:injectable/injectable.dart';

abstract class PokemonService {
  Future<List> getPokemonList();
}

@Singleton(as: PokemonService)
class DefaultPokemonService implements PokemonService {
  @override
  Future<List> getPokemonList() async {
    return [];
  }
}