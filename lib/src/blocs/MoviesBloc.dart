import 'package:flutterapp/src/resources/Repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

import '../models/ItemModel.dart';

class MoviesBloc {
  final _repository = Repository();
  final _moviesFectcher = PublishSubject<ItemModel>();

  Stream<ItemModel> get allMovies => _moviesFectcher.stream;

  fetchAllMovices() async {
    ItemModel itemModel = await _repository.fetchAllMovies();
    _moviesFectcher.sink.add(itemModel);
  }

  dispose() {
    _moviesFectcher.close();
  }  
}

final bloc = MoviesBloc();
