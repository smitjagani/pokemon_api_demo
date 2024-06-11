import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smit_jagani_flutter_task/bloc/api_bloc/api_event.dart';
import 'package:smit_jagani_flutter_task/bloc/api_bloc/api_state.dart';
import 'package:smit_jagani_flutter_task/models/pokemon_detail_model.dart';
import 'package:smit_jagani_flutter_task/models/pokemon_model.dart';
import 'package:smit_jagani_flutter_task/repository/api_repository/api_repository.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  DataBloc() : super(DataInitial([], [], false, 0)) {
    final ApiRepository apiRepository = ApiRepository();

    // Handling the GetData event.
    on<GetData>(
      (event, emit) async {
        try {
          if (state.pokemonList.isNotEmpty) {
            state.fetch = true;
            state.offset += 20;
          } else {
            emit(DataLoading(state.pokemonList, state.pokemonDetailList, false, state.offset));
          }

          // Fetch data from the API.
          final response = await apiRepository.fetchData(offset: state.offset);

          if (response != null) {
            // Convert API response to a list of PokemonResponse objects.
            final List<PokemonResponse> pokemonResponses = (response['results'] as List<dynamic>)
                .map((item) => PokemonResponse.fromJson(item))
                .toList();

            state.pokemonList.addAll(pokemonResponses);

            for (var i = 0; i < pokemonResponses.length; i++) {
              final pokemonResponse = await apiRepository.fetchImage(url:pokemonResponses[i].url);
              final pokemon = PokemonDetailResponse.fromJson({
                'image': pokemonResponse['sprites']['front_default'],
                'types': pokemonResponse['types'],
                'height': pokemonResponse['height'],
                'weight': pokemonResponse['weight']
              });
              state.pokemonDetailList.add(pokemon);
            }

            // Emit DataLoaded state.
            emit(DataLoaded(state.pokemonList, state.pokemonDetailList, state.fetch, state.offset));

            // Delay to simulate loading and then set fetch flag to false.
            await Future.delayed(const Duration(milliseconds: 500), () {
              state.fetch = false;
              emit(DataLoaded(state.pokemonList, state.pokemonDetailList, state.fetch, state.offset));
            });
          }
        } catch (e) {
          // Handle error and emit DataError state.
          debugPrint(e.toString());
          emit(DataError(
              e.toString(), state.pokemonList, state.pokemonDetailList, state.fetch, state.offset));
        }
      },
    );
  }
}
