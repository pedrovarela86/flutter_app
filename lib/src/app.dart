import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ui/body/MovieList.dart';

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: MovieList(),
    );
  }
}