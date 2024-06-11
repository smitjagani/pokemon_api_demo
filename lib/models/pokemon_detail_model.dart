import 'package:json_annotation/json_annotation.dart';

part 'pokemon_detail_model.g.dart';

@JsonSerializable()
class PokemonDetailResponse {
  final String image;
  final List types;
  final int height;
  final int weight;

  PokemonDetailResponse({
    required this.image,
    required this.types,
    required this.height,
    required this.weight,
  });

  factory PokemonDetailResponse.fromJson(Map<String, dynamic> json) => _$PokemonDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonDetailResponseToJson(this);
}
