import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smit_jagani_flutter_task/bloc/api_bloc/api_bloc.dart';
import 'package:smit_jagani_flutter_task/routes/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DataBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Task',

        /// Disable debug banner
        debugShowCheckedModeBanner: false,

        /// Define app routes
        routes: <String, WidgetBuilder>{
          ...Routes.routes,
        },

        /// Define initial route
        initialRoute: Routes.initial,

      ),
    );
  }
}
