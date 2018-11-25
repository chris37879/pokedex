import 'dart:async';
import 'dart:convert';

import 'package:pokedex/bloc.dart';
import 'package:pokedex/helpers.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/services/pokemon_api/pokemon_api.dart';

class PokemonLoaderBloc extends Bloc {
  Stream<Pokemon> get pokemonStream => _pokemonController.stream;
  Sink<int> get pokemonId => _pokemonIdController.sink;
  Sink<String> get pokemonName => _pokemonNameController.sink;

  final _pokemonController = StreamController<Pokemon>.broadcast();
  final _pokemonIdController = StreamController<int>();
  final _pokemonNameController = StreamController<String>();

  PokemonLoaderBloc() {
    _pokemonIdController.stream.listen(_loadPokemonFromJsonById);
    _pokemonNameController.stream.listen(_loadPokemonFromJsonByName);
  }

  Future<void> _loadPokemonFromJsonById(int id) =>
      _loadPokemonFromJson(byId: id);

  Future<void> _loadPokemonFromJsonByName(String name) =>
      _loadPokemonFromJson(byName: name);

  Future<void> _loadPokemonFromJson({int byId, String byName}) async {
    String data;

    if (byId != null)
      data = await PokemonApi.getPokemonData(byId: byId);
    else if (byName != null)
      data = await PokemonApi.getPokemonData(byName: byName);

    var jsonData = json.decode(data);
    jsonData['name'] = Helpers.capitalize(jsonData['name'] as String);
    var pokemon = Pokemon.fromJson(jsonData);
    _pokemonController.add(pokemon);
  }

  @override
  void dispose() {
    _pokemonController.close();
    _pokemonIdController.close();
    _pokemonNameController.close();
  }
}
