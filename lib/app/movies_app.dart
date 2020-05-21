import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'Routes.dart';
import 'modules/details/movie_details.dart';
import 'modules/home/movie_home.dart';

class MoviesModularApp extends MainModule {
  
  @override
  List<Bind> get binds => [];

  @override
  Widget get bootstrap => _AppWidget();

  @override
  List<Router> get routers => [
        Router(Routers.home, child: (_,args) => MovieList()),
        Router(Routers.details, child: (_, args) => MovieDetail(movieId:args.params['id']))
      ];
}

class _AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routers.home,
      onGenerateRoute: Modular.generateRoute,
      navigatorKey: Modular.navigatorKey,
    );
  }
}
