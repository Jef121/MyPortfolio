import 'package:flutter/material.dart';
 class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('About Page'),
        ),
      ),
    );
  }
 }