import 'package:flutter/material.dart';
import 'package:ch6_starter_exercise/PopupButtons.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Custom Widgets',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: const <Widget>[
                MyContainerWidget(),
                Divider(),
                MyColumnWidget(),
                Divider(),
                MyRowWidget(),
                Divider(),
                MyColumnAndRowNestingWidget(),
                Divider(),
                MyButtonsWidget(),
                Divider(),
                MyButtonBarWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyContainerWidget extends StatelessWidget {
  const MyContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.lightBlue.shade50,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: Colors.blueAccent, width: 2),
      ),
      child: const Center(
        child: Text(
          'Flutter is fun!',
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent),
        ),
      ),
    );
  }
}

class MyColumnWidget extends StatelessWidget {
  const MyColumnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const <Widget>[
        Text(
          'This',
          style: TextStyle(
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10),
        Text(
          'is',
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10),
        Text(
          'a Flutter Column',
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class MyRowWidget extends StatelessWidget {
  const MyRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const <Widget>[
        Text('Row 1', style: TextStyle(fontSize: 16)),
        Text('Row 2', style: TextStyle(fontSize: 16)),
        Text('Row 3', style: TextStyle(fontSize: 16)),
      ],
    );
  }
}

class MyColumnAndRowNestingWidget extends StatelessWidget {
  const MyColumnAndRowNestingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Nested Columns and Rows:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
          PopupMenuButtonWidget(),
          Divider(),
        Row(
          children: <Widget>[
            Icon(Icons.star, color: Colors.amber),
            SizedBox(width: 10),
            Text('Star inside column'),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: <Widget>[
            Icon(Icons.star, color: Colors.amber),
            SizedBox(width: 10),
            Text('Star inside column'),
          ],
        ),
      ],
    );
  }
}

class MyButtonsWidget extends StatelessWidget {
  const MyButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {},
              child: const Text('Add'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Save'),
            ),
            OutlinedButton(
              onPressed: () {},
              child: const Text('Delete'),
            ),
          ],
        ),
        const SizedBox(
          height: 200,
        ),
      ],
    );
  }
}

class MyButtonBarWidget extends StatelessWidget {
  const MyButtonBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.arrow_forward),
          onPressed: () {},
        ),
      ],
    );
  }
}
