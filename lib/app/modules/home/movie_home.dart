import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterapp/app/blocs/movies_bloc.dart';
import 'package:flutterapp/app/models/item_model.dart';
import 'package:flutterapp/app/models/movie.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:transparent_image/transparent_image.dart';

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
      new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3);

  void openDetails(Movie movie) {
    Modular.to.pushNamed(Routers.details, arguments: movie);
  }

  return GridView.builder(
      itemCount: snapshot.data.results.length,
      gridDelegate: gridDelagate,
      itemBuilder: (BuildContext context, int index) {
        var movieTitle = Text("${snapshot.data.results[index].title}", textAlign: TextAlign.center,);

        var movieImage = 
        FadeInImage.memoryNetwork(placeholder:kTransparentImage, image: snapshot.data.results[index].movieURL,fadeInCurve: Curves.bounceIn,);
        

        var column = Column(
          children: [
            Flexible(flex: 3, fit: FlexFit.loose, child: movieImage),
            Flexible(flex: 1, fit: FlexFit.loose, child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: movieTitle,
            ))
          ],
        );

        var inkResponse = InkResponse(
            child: column,
            onTap: () => openDetails(snapshot.data.results[index]));

        return GridTile(child: inkResponse);
      });
}
