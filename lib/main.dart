import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_api/ui/pages/characters/bloc/characters_bloc.dart';
import 'package:marvel_api/ui/pages/comics/bloc/comics_bloc.dart';
import 'package:marvel_api/ui/pages/home/bloc/home_bloc.dart';
import 'package:marvel_api/ui/pages/root/root/navigation_bloc/navigation_cubit.dart';
import 'package:marvel_api/ui/pages/root/root/root_page.dart';
import 'package:marvel_api/ui/routes.dart';
import 'dependency_injection/injection.dart' as di;

void main() {
  
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  // HttpOverrides.global = MyHttpOverrides();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => NavigationCubit(),
    ),
    BlocProvider(create: (_) => di.locator<HomeBloc>()),
    BlocProvider(create: (_) => di.locator<CharactersBloc>()),
    BlocProvider(create: (_) => di.locator<ComicsBloc>()),
  ], child: const MyApp()));
}


class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
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
      // theme: theme(context),
      home: const RootPage(),
    );
  }
}
