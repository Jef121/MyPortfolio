import 'package:flutter/material.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World App',
      theme: ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.green,
      textTheme: const TextTheme(
  ),
),

      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHelloWorldState();
}

class _MyHelloWorldState extends State<MyHomePage> {
  double _maxBid = 0.0;

  void _incrementCounter() {
    setState(() {
      _maxBid += 50;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Hello World App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('My Maximum Bid: $_maxBid'),
            const Text('You have pressed the button this many times:'),
            Text(
              '$_maxBid',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
