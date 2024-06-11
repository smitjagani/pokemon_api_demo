import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smit_jagani_flutter_task/bloc/api_bloc/api_bloc.dart';
import 'package:smit_jagani_flutter_task/bloc/api_bloc/api_state.dart';
import 'package:smit_jagani_flutter_task/components/widgets/app_bar.dart';
import 'package:smit_jagani_flutter_task/components/widgets/network_image_view.dart';

class PokemonDetailScreen extends StatefulWidget {
  final int? index;
  final Color? color;

  const PokemonDetailScreen({super.key, this.index, this.color});

  @override
  State<PokemonDetailScreen> createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppTitle(
        title: "Pokemon Details",
        isBack: true,
      ),
      body: BlocBuilder<DataBloc, DataState>(
        builder: (context, state) {
          if (state is DataInitial || state is DataLoading) {
            return CircularProgressIndicator.adaptive();
          } else if (state is DataLoaded) {
            // Show grid view with loaded data
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    width: double.infinity,
                    decoration:
                        BoxDecoration(color: widget.color, borderRadius: BorderRadius.circular(20)),
                    margin: EdgeInsets.only(top: MediaQuery.of(context).size.width / 5),
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.width / 5, left: 16, right: 16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              state.pokemonList[widget.index!].name.toUpperCase(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .apply(fontWeightDelta: 2, fontSizeFactor: 1.2),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text.rich(TextSpan(
                            text: "Height :\n",
                            style: Theme.of(context).textTheme.bodyLarge!.apply(fontWeightDelta: 2),
                            children: [
                              TextSpan(
                                text: state.pokemonDetailList[widget.index!].height.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .apply(fontWeightDelta: 1, color: Colors.black.withOpacity(.6)),
                              ),
                            ])),
                        const SizedBox(height: 10),
                        Text.rich(TextSpan(
                            text: "Weight :\n",
                            style: Theme.of(context).textTheme.bodyLarge!.apply(fontWeightDelta: 2),
                            children: [
                              TextSpan(
                                text: state.pokemonDetailList[widget.index!].weight.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .apply(fontWeightDelta: 1, color: Colors.black.withOpacity(.6)),
                              ),
                            ])),
                        const SizedBox(height: 10),
                        Text.rich(TextSpan(
                            text: "Types :\n",
                            style: Theme.of(context).textTheme.bodyLarge!.apply(fontWeightDelta: 2),
                            children: [
                              for (var e in state.pokemonDetailList[widget.index!].types)
                                TextSpan(
                                  text: "${e["type"]["name"]}\n",
                                  style: Theme.of(context).textTheme.bodyLarge!.apply(
                                      fontWeightDelta: 1, color: Colors.black.withOpacity(.6)),
                                ),
                            ])),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.width / 2.8,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        shape: BoxShape.circle,
                        border: Border.all(color: widget.color!, width: 2)),
                    child: NetworkImageView(state.pokemonDetailList[widget.index!].image),
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
