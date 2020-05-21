import 'package:flutter/material.dart';

//Movie details page
class MovieDetail extends StatefulWidget{

  final int movieId;

  MovieDetail({Key key, this.movieId}):super(key:key);

    @override
  State<StatefulWidget> createState() => _MovieDetailState();
}

//Movie details page state
class _MovieDetailState extends State<MovieDetail>{
 
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text("Movie details ${widget.movieId}"),
    ),
    body: Center(
      child: Text("Movie details page"),
    ),
  );
}