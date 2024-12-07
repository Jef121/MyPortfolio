import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Custom Widget Tree',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                 IntroSection(),
                 SizedBox(height: 20.0),
                 ButtonsRow(),
                 SizedBox(height: 20.0),
                 MyFlutter(),
                 SizedBox(height: 20.0),
                 LayeredWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class IntroSection extends StatelessWidget{
  const IntroSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.teal.shade100,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Welcome to My App',
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.0),
          Text(
            'Explore the layout and features presented in this widget tree.',
            style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}

class ButtonsRow extends StatelessWidget{
    const ButtonsRow({super.key});
    @override
  Widget build(BuildContext context) {
    return Material(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {},
            child: const Text('Button 1'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Button 2'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Button 3'),
          ),
        ],
      ),
    );
  }
}

class MyFlutter extends StatelessWidget{
  const MyFlutter({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(50.0),
          child: Image.asset(
            'assets/images/flutter-logo.png',
            width: 100,
          ),
        ),
        const SizedBox(width: 16.0),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'I am flutter',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                'A fun library create by Google with many beautiful built-in designs.',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class LayeredWidget extends StatelessWidget{
  const LayeredWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          width: 200.0,
          height: 200.0,
          color: Colors.teal.shade400,
          child: const Text(
            'I',
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          width: 150.0,
          height: 150.0,
          color: Colors.teal.shade300,
          child: const Text(
            'am',
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          width: 100.0,
          height: 100.0,
          color: Colors.teal.shade200,
          child: const Text(
            'Flutter',
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
        const Text(
          'Hello!',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
