import 'package:flutter_test/flutter_test.dart';
import 'package:flutterapp/app/playground/Mixins.dart';

void main(){
  test("Testing mixing", (){

      final bird = new Bird();

      bird.chirp();

      expect(bird.action, "chirp");

  }); 
}