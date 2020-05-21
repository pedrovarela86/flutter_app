import 'package:flutterapp/app/models/item_model.dart';
import 'package:flutterapp/app/resources/Repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

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
