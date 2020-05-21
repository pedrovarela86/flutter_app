import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterapp/app/blocs/movies_bloc.dart';
import 'package:flutterapp/app/models/item_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../Routes.dart';

//Movie list page
class MovieList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MovieListState();
}

//State of Movie list page state
class _MovieListState extends State<MovieList> {
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
          onTap: () => fluttertoast(index)
        );

        return GridTile(child: inkResponse);
      });
}

void fluttertoast(int index) {
   Fluttertoast.showToast(msg: index.toString());
   Modular.to.pushNamed(Routers.details,arguments: index);
}
