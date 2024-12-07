import 'package:flutter/material.dart';

// Global Variables
String myChapter = "My Chapter 3";
String myString = 'You have pressed the button this many times:';
bool isStarted = true;

// Sample List of Items
List<Map<String, dynamic>> myItems = [
  {'name': 'Apple', 'quantity': 10, 'price': 2.5},
  {'name': 'Banana', 'quantity': 5, 'price': 1.2},
  {'name': 'Orange', 'quantity': 8, 'price': 1.8},
];

void main() {
  runApp(const MyApp());
  //This is a single-line comment

  /*
  This is a multi-line comment
  */
}

mixin LoggerMixin {
  void logMessage(String message) {
    final now = DateTime.now();
    Text('[$now] LOG: $message');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: myChapter,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.green,
        textTheme: const TextTheme(),
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

class _MyHelloWorldState extends State<MyHomePage> with LoggerMixin {
  int _maxBid = 0;

  Future<void> _incrementCounter() async {
    if (isStarted && _maxBid <= 500) {
      setState(() {
        _maxBid += 20;
        isStarted = false;
      });

      logMessage('Counter incremented to $_maxBid');

      await for (int i in Stream<int>.periodic(
          const Duration(milliseconds: 300), (x) => x).take(5)) {
        if (_maxBid > 500) break;
        setState(() {
          myString = "You won the bid!";
        });
        i++;
      }
      isStarted = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(myChapter),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('My Maximum Bid: $_maxBid'),
            Text(myString),
            Text(
              '$_maxBid',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 40),
            const Text('Hello World!'),
            const SizedBox(height: 40),
            const Text('Items in the List:'),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: myItems.length,
                itemBuilder: (context, index) {
                  final item = myItems[index];
                  return ListTile(
                    title: Text(item['name']),
                    subtitle: Text(
                        'Quantity: ${item['quantity']}, Price: \$${item['price']}'),
                  );
                },
              ),
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
