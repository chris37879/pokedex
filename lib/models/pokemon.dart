import 'package:json_annotation/json_annotation.dart';

part 'pokemon.g.dart';

@JsonSerializable()
class Pokemon {
  /// Pokemon's ID
  int id;

  /// Pokemon's Name
  String name;

  // TODO: Figure out what unit this is in for conversion at display time.
  /// Pokemon's height in <unit>
  int height;

  /// Pokemon's base experience
  @JsonKey(name: "base_experience")
  int baseExperience;

  /// TODO: WTF is this?
  bool isDefault;

  /// TODO: WTF is this?
  int order;

  // TODO: Figure out what unit this is in for conversion at display time.
  /// Pokemon's weight in <unit>
  int weight;

  SpriteSet sprites;

  // TODO: Add complex types such as sprites, stats, types, etc.

  Pokemon(this.id, this.name, this.height, this.baseExperience, this.isDefault,
      this.order, this.weight, this.sprites);

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonToJson(this);
}

@JsonSerializable()
class SpriteSet {
  @JsonKey(name: "back_female")
  String backFemale;

  @JsonKey(name: "back_shiny_female")
  String backShinyFemale;

  @JsonKey(name: "back_default")
  String backDefault;

  @JsonKey(name: "front_female")
  String frontFemale;

  @JsonKey(name: "front_shiny_female")
  String frontShinyFemale;

  @JsonKey(name: "back_shiny")
  String backShiny;

  @JsonKey(name: "front_default")
  String frontDefault;

  @JsonKey(name: "front_shiny")
  String frontShiny;

  SpriteSet(
      this.backFemale,
      this.backShinyFemale,
      this.backDefault,
      this.frontFemale,
      this.frontShinyFemale,
      this.backShiny,
      this.frontDefault,
      this.frontShiny);

  factory SpriteSet.fromJson(Map<String, dynamic> json) =>
      _$SpriteSetFromJson(json);

  Map<String, dynamic> toJson() => _$SpriteSetToJson(this);
}

@JsonSerializable()
class PokemonType {}
