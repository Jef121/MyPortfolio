import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void incrementCounter() {
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                OrientationLayoutIconsWidget(),
                Divider(),
                OrientationLayoutWidget(),
                GridViewWidget(),
                Divider(),
                OrientationBuilderWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OrientationLayoutIconsWidget extends StatelessWidget {
  const OrientationLayoutIconsWidget({super.key});
  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return orientation == Orientation.portrait
        ? const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.school,
                size: 48.0,
              ),
            ],
          )
        : const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.school,
                size: 48.0,
              ),
              Icon(
                Icons.brush,
                size: 48.0,
              ),
            ],
          );
  }
}


class OrientationLayoutWidget extends StatelessWidget {
  const OrientationLayoutWidget({super.key});
  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return orientation == Orientation.portrait
        ? Container(
      alignment: Alignment.center,
      color: Colors.yellow,
      height: 100.0,
      width: 100.0,
      child: const Text('Portrait'),
    )
        : Container(
      alignment: Alignment.center,
      color: Colors.lightGreen,
      height: 100.0,
      width: 200.0,
      child: const Text('Landscape'),
    );
  }
 }


 class GridViewWidget extends StatelessWidget {
  const GridViewWidget({super.key});
  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
      childAspectRatio: 5.0,
      children: List.generate(8, (int index) {
        return Text("Grid $index", textAlign: TextAlign.center,);
      }),
    );
  }
 }


  class OrientationBuilderWidget extends StatelessWidget {
  const OrientationBuilderWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        return orientation == Orientation.portrait
            ? Container(
          alignment: Alignment.center,
          color: Colors.yellow,
          height: 100.0,
          width: 100.0,
          child: const Text('Portrait'),
        )
            : Container(
          alignment: Alignment.center,
          color: Colors.lightGreen,
          height: 100.0,
          width: 200.0,
          child: const Text('Landscape'),
        );
      },
    );
  }
 }
