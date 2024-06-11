import 'package:smit_jagani_flutter_task/models/pokemon_detail_model.dart';
import 'package:smit_jagani_flutter_task/models/pokemon_model.dart';

/// Abstract class representing different states of data.
abstract class DataState {
  int offset = 20;
  List<PokemonResponse> pokemonList = [];
  List<PokemonDetailResponse> pokemonDetailList = [];
  bool fetch = false;

  DataState(this.pokemonList,this.pokemonDetailList, this.fetch, this.offset);
}

/// Represents the initial state of data.
class DataInitial extends DataState {
  DataInitial(super.pokemonList,super.pokemonDetailList, super.fetch, super.limit);
}

/// Represents the state when data is being loaded.
class DataLoading extends DataState {
  DataLoading(super.pokemonList,super.pokemonDetailList, super.fetch, super.limit);
}

/// Represents the state when data has been loaded successfully.
class DataLoaded extends DataState {
  DataLoaded(super.pokemonList,super.pokemonDetailList, super.fetch, super.limit);
}

/// Represents the state when an error occurs during data fetching.
class DataError extends DataState {
  final String error;

  DataError(this.error, super.pokemonList,super.pokemonDetailList, super.fetch, super.limit);
}
