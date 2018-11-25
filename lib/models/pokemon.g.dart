// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pokemon _$PokemonFromJson(Map<String, dynamic> json) {
  return Pokemon(
      json['id'] as int,
      json['name'] as String,
      json['height'] as int,
      json['base_experience'] as int,
      json['isDefault'] as bool,
      json['order'] as int,
      json['weight'] as int,
      json['sprites'] == null
          ? null
          : SpriteSet.fromJson(json['sprites'] as Map<String, dynamic>));
}

Map<String, dynamic> _$PokemonToJson(Pokemon instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'height': instance.height,
      'base_experience': instance.baseExperience,
      'isDefault': instance.isDefault,
      'order': instance.order,
      'weight': instance.weight,
      'sprites': instance.sprites
    };

SpriteSet _$SpriteSetFromJson(Map<String, dynamic> json) {
  return SpriteSet(
      json['back_female'] as String,
      json['back_shiny_female'] as String,
      json['back_default'] as String,
      json['front_female'] as String,
      json['front_shiny_female'] as String,
      json['back_shiny'] as String,
      json['front_default'] as String,
      json['front_shiny'] as String);
}

Map<String, dynamic> _$SpriteSetToJson(SpriteSet instance) => <String, dynamic>{
      'back_female': instance.backFemale,
      'back_shiny_female': instance.backShinyFemale,
      'back_default': instance.backDefault,
      'front_female': instance.frontFemale,
      'front_shiny_female': instance.frontShinyFemale,
      'back_shiny': instance.backShiny,
      'front_default': instance.frontDefault,
      'front_shiny': instance.frontShiny
    };

PokemonType _$PokemonTypeFromJson(Map<String, dynamic> json) {
  return PokemonType();
}

Map<String, dynamic> _$PokemonTypeToJson(PokemonType instance) =>
    <String, dynamic>{};
