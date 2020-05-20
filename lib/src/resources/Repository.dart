import 'package:flutterapp/src/resources/movieApiProvider.dart';

import '../models/ItemModel.dart';

class Repository{

  final MovieProvider moviesApiProvider = MovieApiProvider();

  Future<ItemModel> fetchAllMovies() => moviesApiProvider.fetchMovieList();

}