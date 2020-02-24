import 'package:flutter/material.dart';
import 'package:animated_scroll_builder/animated_scroll_builder.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AnimatedScrollBuilder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AnimatedScrollBuilder(
          controller: scrollController,
          builder: (BuildContext context, double tween) {
            return Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Opacity(
                  opacity: 1 - tween,
                  child: Text("Animated Demo"),
                ),
                Opacity(
                  opacity: tween,
                  child: Text("Awesome Animated!"),
                ),
              ],
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(20),
              height: 1000,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
