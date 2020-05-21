import 'package:flutterapp/app/models/item_model.dart';
import 'package:flutterapp/src/resources/movieApiProvider.dart';


class Repository{

  final MovieProvider moviesApiProvider = MovieApiProvider();

  Future<ItemModel> fetchAllMovies() => moviesApiProvider.fetchMovieList();

}