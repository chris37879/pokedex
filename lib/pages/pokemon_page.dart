import 'package:flutter/material.dart';
import 'package:pokedex/blocs/pokemon_loader_bloc.dart';
import 'package:pokedex/models/pokemon.dart';

class PokemonPage extends StatelessWidget {
  final PokemonLoaderBloc pokemonLoaderBloc;

  PokemonPage({
    this.pokemonLoaderBloc,
    int initialPokemonId,
    String initialPokemonName,
  }) {
    if (initialPokemonId != null)
      pokemonLoaderBloc.pokemonId.add(initialPokemonId);
    if (initialPokemonName != null)
      pokemonLoaderBloc.pokemonName.add(initialPokemonName);
  }

  @override
  Widget build(BuildContext context) => StreamBuilder<Pokemon>(
        stream: pokemonLoaderBloc.pokemonStream,
        initialData: null,
        builder: (BuildContext c, AsyncSnapshot<Pokemon> snapshot) {
          var pokemon = snapshot?.data;
          if (pokemon == null)
            return Container();
          else
            return Scaffold(
              appBar: _buildAppBar(context, pokemon),
              body: _buildBody(context, pokemon),
            );
        },
      );

  Widget _buildAppBar(BuildContext context, Pokemon pokemon) => AppBar(
        title: Text(pokemon.name),
      );

  Widget _buildBody(BuildContext context, Pokemon pokemon) => ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Image.network(
                pokemon.sprites.frontDefault,
                fit: BoxFit.contain,
                scale: 0.5,
                filterQuality: FilterQuality.high,
              ),
              Text("Height: " + pokemon.height.toString()),
              Text("Weight: " + pokemon.weight.toString()),
            ],
          ),
        ],
      );
}
