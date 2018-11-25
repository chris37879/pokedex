import 'dart:async';
import 'dart:convert';

import 'package:pokedex/bloc.dart';
import 'package:pokedex/helpers.dart';
import 'package:pokedex/services/pokemon_api/pokemon_api.dart';

class PokemonListBloc extends Bloc {
  Stream<List<String>> get pokemonStream => _pokemonListController.stream;

  List<String> _currentList = [];
  final _pokemonListController = StreamController<List<String>>.broadcast();

  PokemonListBloc() {
    _loadPokemonListFromJson();
    _pokemonListController.onListen = () {
      _pokemonListController.add(_currentList);
    };
  }

  Future<void> _loadPokemonListFromJson() async {
    var data = await PokemonApi.getPokemonList();
    var jsonData = json.decode(data) as Map<String, dynamic>;
    var list = jsonData['results'];
    _currentList.clear();
    for (var entry in list) {
      var name = entry['name'] as String;
      _currentList.add(name);
    }
    _pokemonListController.add(_currentList);
  }

  @override
  void dispose() {
    _pokemonListController.close();
  }
}
