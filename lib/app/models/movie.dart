//Movie class
class Movie{
  int _id;
  get id => _id;

  int _voteCount;
  get voteCount => _voteCount;
  
  bool _video;
  get video => _video;

  String _posterPath;
  get posterPath => _posterPath;

  get movieURL => "https://image.tmdb.org/t/p/w185$_posterPath";

  String _title;
  get title => _title;

  String _overview;
  get overview => _overview;

  String _backdropPath;
  get backdropPath => "https://image.tmdb.org/t/p/w185$_backdropPath";

  Movie(result){
    _voteCount = result[VOTE_COUNT];
    _id = result[ID];
    _posterPath = result[POSTER_PATH];
    _title = result[TITLE];
    _overview = result[OVERVIEW];
    _backdropPath = result[BACKDROP_PATH];
  }

  static const VOTE_COUNT = 'vote_count';
  static const ID = 'id';
  static const POSTER_PATH = 'poster_path';
  static const TITLE = 'title';
  static const OVERVIEW = 'overview';
  static const BACKDROP_PATH = 'backdrop_path';
}