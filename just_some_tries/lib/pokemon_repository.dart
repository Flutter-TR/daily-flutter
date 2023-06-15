import 'package:just_some_tries/pokemon_service.dart';
import 'package:injectable/injectable.dart';

abstract class PokemonRepository {
  Future<List> getPokemonList();
}

@Injectable(as: PokemonRepository)
class DefaultPokemonRepository implements PokemonRepository {
  final PokemonService _pokemonService;

  DefaultPokemonRepository(this._pokemonService);

  @override
  Future<List> getPokemonList() async {
    return await _pokemonService.getPokemonList();
  }
}