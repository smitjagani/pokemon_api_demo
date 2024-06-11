import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smit_jagani_flutter_task/bloc/api_bloc/api_bloc.dart';
import 'package:smit_jagani_flutter_task/bloc/api_bloc/api_event.dart';
import 'package:smit_jagani_flutter_task/bloc/api_bloc/api_state.dart';
import 'package:smit_jagani_flutter_task/components/widgets/app_bar.dart';
import 'package:smit_jagani_flutter_task/components/widgets/network_image_view.dart';
import 'package:smit_jagani_flutter_task/screens/pokemon/pokemon_detail_screen.dart';

class PokeMonsScreen extends StatefulWidget {
  const PokeMonsScreen({super.key});

  @override
  State<PokeMonsScreen> createState() => _PokeMonsScreenState();
}

class _PokeMonsScreenState extends State<PokeMonsScreen> {
  Color getRandomColor() {
    final Random random = Random();
    return Color.fromRGBO(
      random.nextInt(200) + 77,
      random.nextInt(200) + 77,
      random.nextInt(200) + 77,
      0.3,
    );
  }

  @override
  void initState() {
    BlocProvider.of<DataBloc>(context).add(GetData()); // Trigger data fetching
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppTitle(title: "Pokemon API"),
      body: BlocBuilder<DataBloc, DataState>(
        builder: (context, state) {
          if (state is DataInitial || state is DataLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (state is DataLoaded) {
            // Show grid view with loaded data
            return NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                // Check if scroll reached the end to load more data
                if (notification is ScrollEndNotification &&
                    notification.metrics.extentAfter == 0) {
                  // Load next page of data
                  BlocProvider.of<DataBloc>(context).add(GetData());
                  return true;
                }
                return false;
              },
              child: Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
                      shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16.0,
                        mainAxisSpacing: 16.0,
                      ),
                      itemCount: state.pokemonDetailList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PokemonDetailScreen(
                                  index: index,
                                  color: getRandomColor(),
                                ),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: getRandomColor(),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: NetworkImageView(state.pokemonDetailList[index].image)),
                                Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Text(
                                    state.pokemonList[index].name.toUpperCase(),
                                    style: Theme.of(context).textTheme.bodyMedium!.apply(
                                          fontWeightDelta: 2,
                                        ),
                                    maxLines: 1,
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  if (state.fetch)
                    const Center(
                      child: CupertinoActivityIndicator(),
                    ),
                ],
              ),
            );
          } else if (state is DataError) {
            // Show error message if there's an error
            return Center(
              child: Text(state.error),
            );
          } else {
            // Show default error message for unknown error
            return const Center(child: Text("Unknown Error!"));
          }
        },
      ),
    );
  }
}
