import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutterapp/app/models/movie.dart';
import 'package:transparent_image/transparent_image.dart';

//Movie details page
class MovieDetail extends StatefulWidget{

  final Movie movie;

  MovieDetail({this.movie});

    @override
  State<StatefulWidget> createState() => _MovieDetailState(movie: movie);
}

//Movie details page state
class _MovieDetailState extends State<MovieDetail>{
 
 final Movie movie;

 _MovieDetailState({this.movie});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text("${movie.title}"),
    ),
    body: FadeInImage.assetNetwork(placeholder:'test.jpg', image: movie.movieURL,fadeInCurve: Curves.bounceIn,),
  );
}