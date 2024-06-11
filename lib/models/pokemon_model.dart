// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'pokemon_model.g.dart';

@JsonSerializable()
class PokemonResponse {
  final String name;
  final String url;

  PokemonResponse({
    required this.name,
    required this.url,
  });

  factory PokemonResponse.fromJson(Map<String, dynamic> json) => _$PokemonResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonResponseToJson(this);
}
