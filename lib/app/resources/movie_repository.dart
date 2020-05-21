

import 'package:flutterapp/app/models/item_model.dart';

import 'movie_api_provider.dart';

class Repository{

  final MovieProvider moviesApiProvider = MovieApiProvider();

  Future<ItemModel> fetchAllMovies() => moviesApiProvider.fetchMovieList();

}