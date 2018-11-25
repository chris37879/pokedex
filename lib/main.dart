import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/blocs/pokemon_list_bloc.dart';
import 'package:pokedex/blocs/pokemon_loader_bloc.dart';
import 'package:pokedex/pages/home_page.dart';
import 'package:pokedex/pages/pokemon_page.dart';

void main() => runApp(App());

var kRouter = Router();

class App extends StatelessWidget {
  App() {
    kRouter.define("/",
        handler: Handler(
            handlerFunc: (context, params) => HomePage(
                  pokemonListBloc: PokemonListBloc(),
                )));
    kRouter.define("/pokemon/:identifier", handler: Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
        var isId = params['identifier'][0] is int;
        var isName = params['identifier'][0] is String;

        var pokemonLoaderBloc = PokemonLoaderBloc();

        if (isId) {
          return PokemonPage(
            initialPokemonId: params['identifier'][0] as int,
            pokemonLoaderBloc: pokemonLoaderBloc,
          );
        } else if (isName) {
          return PokemonPage(
            initialPokemonName: params['identifier'][0] as String,
            pokemonLoaderBloc: pokemonLoaderBloc,
          );
        }
      },
    ));
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'PokeDex',
        theme: ThemeData.light(),
        initialRoute: '/',
        onGenerateRoute: kRouter.generator,
      );
}
