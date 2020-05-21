class Result{
  int _id;
  get id => _id;

  int _voteCount;
  get voteCount => _voteCount;
  
  bool _video;
  get video => _video;

  String _posterPath;
  get posterPath => _posterPath;

  Result(result){
    _voteCount = result[VOTE_COUNT];
    _id = result[ID];
    _posterPath = result[POSTER_PATH];
  }

  static const VOTE_COUNT = 'vote_count';
  static const ID = 'id';
  static const POSTER_PATH = 'poster_path';
}