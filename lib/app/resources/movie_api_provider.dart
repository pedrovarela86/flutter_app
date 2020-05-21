import 'package:flutterapp/app/models/item_model.dart';
import 'package:http/http.dart' show Client;
import 'dart:convert';

abstract class MovieProvider {
   Future<ItemModel> fetchMovieList();
}

class MovieApiProvider implements MovieProvider {
  
  Client client = Client();
  final String _url = "https://api.themoviedb.org/3/movie/popular?api_key=0ed8ce8dccccd2dfddebe14efc0f7df3";

  @override
  Future<ItemModel> fetchMovieList() async {
    print("entered");
    final response = await client.get("$_url" );
    print(response.body.toString());

    if (response.statusCode == 200) {
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load post");
    }
  }
}
