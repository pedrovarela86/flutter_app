import 'package:flutter/material.dart';

class SamplePage extends StatefulWidget {
  SamplePage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SwitchApp();
}

class _SwitchApp extends State<SamplePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Swith components"),
        ),
        body: Column(
          children: [
            Center(
              child: _getToggletChild(),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _toggle,
          tooltip: 'Update text',
          child: Icon(Icons.update),
        ),
      );

  Widget _getToggletChild() {
    if (__toggle) {
      return Text('Togglet one');
    } else {
      return MaterialButton(
        onPressed: () {},
        child: Text('Togglet Two'),
      );
    }
  }

  bool __toggle = true;

  void _toggle() {
    setState(() {
      __toggle = !__toggle;
    });
  }
}

class FadeAppTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: "Fade demo",
        theme: ThemeData(primarySwatch: Colors.yellow),
        home: MyFadeTest(title: "Fade Demo"),
      );
}

class MyFadeTest extends StatefulWidget {
  final String title;

  MyFadeTest({Key key, this.title}) : super(key: key);


  @override
  State<StatefulWidget> createState() => _MyFadeTest();
}

class _MyFadeTest extends State<MyFadeTest> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }

}

class _SamplePageState extends State<SamplePage> {
  //Default placeholder text
  String textToShow = "I like Flutter";

  void _updateText() {
    setState(() {
      textToShow = "Flutter is awesome";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sample text"),
      ),
      body: Column(
        children: [
          MaterialButton(
            color: Colors.blue,
            onPressed: () {},
            child: Text('Hello'),
            padding: EdgeInsets.all(10.0),
          ),
          Center(
            child: Text(textToShow),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _updateText,
        tooltip: 'Update Text',
        child: Icon(Icons.update),
      ),
    );
  }
}
