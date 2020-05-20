import 'package:flutterapp/src/models/Result.dart';

import 'Result.dart';

class ItemModel {
  int _page;
  int get page => _page;

  int _totalResults;
  int get totalResults => _totalResults;

  int _totalPages;
  int get totalPages => _totalPages;

  List<dynamic> _results;
  List<dynamic> get results => _results;

  ItemModel.fromJson(Map<String, dynamic> parsedJson) {
    print(parsedJson[RESULTS].length);
    _page = parsedJson[PAGE];
    _totalResults = parsedJson[TOTAL_RESULTS];
    _totalPages = parsedJson[TOTAL_PAGES];
    _results =  parsedJson[RESULTS].map((e) => Result(e)).toList();
  }

  static const String PAGE = 'page';
  static const String RESULTS = 'results';
  static const String TOTAL_PAGES = 'total_pages';
  static const String TOTAL_RESULTS = 'total_results';
}
