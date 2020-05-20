import 'package:flutter/material.dart';
import 'package:flutterapp/src/blocs/MoviesBloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../models/ItemModel.dart';

class MovieList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MovieListState();
}

class MovieListState extends State<MovieList> {
  Scaffold buildScaffold() => Scaffold(
        appBar: AppBar(title: Text("Popular Movies")),
        body: StreamBuilder(
          stream: bloc.allMovies,
          builder: (BuildContext context, AsyncSnapshot<ItemModel> snapshot) {
            if (snapshot.hasData) {
              return buildList(snapshot);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      );

  @override
  void initState() {
    super.initState();
    bloc.fetchAllMovices();
  }

  @override
  Widget build(BuildContext context) => buildScaffold();

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }
}

Widget buildList(AsyncSnapshot<ItemModel> snapshot) {
  var gridDelagate =
      new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2);

  return GridView.builder(
      itemCount: snapshot.data.results.length,
      gridDelegate: gridDelagate,
      itemBuilder: (BuildContext context, int index) {
        var movieTitle = Text("${snapshot.data.results[index].voteCount}");

        var movieImage = Image.network(
            "https://image.tmdb.org/t/p/w185${snapshot.data.results[index].posterPath}",
            colorBlendMode: BlendMode.color,
            fit: BoxFit.contain);

        var column = Column(
          children: [
            Flexible(flex: 3, fit: FlexFit.loose, child: movieImage),
            Flexible(flex: 1, fit: FlexFit.loose, child: movieTitle)
          ],
        );

        var inkResponse = InkResponse(
          child: column,
          onTap: () => Fluttertoast.showToast(msg: index.toString()),
        );

        return GridTile(child: inkResponse);
      });
}
