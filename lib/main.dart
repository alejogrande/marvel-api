import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_api/ui/pages/characters/bloc/characters_bloc.dart';
import 'package:marvel_api/ui/pages/comics/bloc/comics_bloc.dart';
import 'package:marvel_api/ui/pages/home/bloc/home_bloc.dart';

import 'package:marvel_api/ui/pages/root/root/navigation_bloc/navigation_cubit.dart';
import 'package:marvel_api/ui/pages/splash/splash_page.dart';
import 'package:marvel_api/ui/routes.dart';
import 'dependency_injection/injection.dart' as di;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();

  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => NavigationCubit(),
    ),
    BlocProvider(create: (_) => di.locator<CharactersBloc>()),
    BlocProvider(create: (_) => di.locator<ComicsBloc>()),
    BlocProvider(create: (_) => di.locator<HomeBloc>()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'marvel-api',
      debugShowCheckedModeBanner: false,
      routes: appRoutes,
      // initialRoute: ,
      theme:ThemeData(
        primaryColor: Colors.red
      ),
      home: const SplashPage(),
    );
  }
}
