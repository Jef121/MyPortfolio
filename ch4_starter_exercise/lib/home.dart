import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Home',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.deepPurple[900],
      ),
      body: Container(
        child:const Text(
          'Hello World!',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 199, 86, 220),
    );
  }
}
