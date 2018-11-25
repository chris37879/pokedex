import 'package:flutter/material.dart';
import 'package:pokedex/blocs/pokemon_list_bloc.dart';
import 'package:pokedex/helpers.dart';
import 'package:pokedex/main.dart' show kRouter;

class HomePage extends StatelessWidget {
  final PokemonListBloc pokemonListBloc;

  const HomePage({this.pokemonListBloc}) : super();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: _buildAppBar(context),
        body: _buildBody(context),
      );

  Widget _buildAppBar(BuildContext context) => AppBar(
        title: Text("Pokemon"),
      );

  Widget _buildBody(BuildContext context) => StreamBuilder<List<String>>(
        stream: pokemonListBloc?.pokemonStream,
        initialData: [],
        builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) =>
            ListView.builder(
              itemCount: snapshot?.data?.length ?? 0,
              itemBuilder: (BuildContext c, int position) =>
                  _buildListItem(context, snapshot.data[position]),
            ).build(context),
      );

  Widget _buildListItem(BuildContext context, String name) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          InkWell(
            onTap: () async {
              await kRouter.navigateTo(context, "/pokemon/$name");
            },
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Text(Helpers.capitalize(name)),
            ),
          ),
          Divider(
            height: 1.0,
          )
        ],
      );
}
