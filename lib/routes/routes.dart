import 'package:flutter/material.dart';
import 'package:smit_jagani_flutter_task/screens/pokemon/pokemons_screen.dart';

class Routes {
  /// Private constructor to prevent instantiation
  Routes._();

  /// Define all the routes as static constants
  static const String initial = '/';

  /// Map of routes to their corresponding widget builders
  static final routes = <String, WidgetBuilder>{
    initial: (BuildContext context) =>
        const PokeMonsScreen(),
  };
}
