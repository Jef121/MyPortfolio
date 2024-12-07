import 'package:flutter/material.dart';

// HomeClass for Image Exercise

class HomeImageWithDecor extends StatefulWidget {
  const HomeImageWithDecor({super.key, required this.title});
  final String title;
  @override
  State<HomeImageWithDecor> createState() => _MyHomeImageWithDecor();
}

class _MyHomeImageWithDecor extends State<HomeImageWithDecor> {
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
                 ImagesAndIconWidget(),
                 Divider(),
                 BoxDecoratorWidget(),
                 Divider(),
                 InputDecoratorsWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ImagesAndIconWidget extends StatelessWidget {
  const ImagesAndIconWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Image(
          image: const AssetImage("assets/images/flutter-logo.jpg"),
          //color: Colors.orange,
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width / 3,
        ),
        Image.network(
          'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
          width: MediaQuery.of(context).size.width / 3,
        ),
        const Icon(
          Icons.brush,
          color: Colors.lightBlue,
          size: 48.0,
        ),
      ],
    );
  }
 }

class BoxDecoratorWidget extends StatelessWidget {
  const BoxDecoratorWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 100.0,
        width: 100.0,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          color: Colors.orange,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10.0,
              offset: Offset(0.0, 10.0),
            )
          ],
        ),
      ),
    );
  }
 }

class InputDecoratorsWidget extends StatelessWidget {
  const InputDecoratorsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextField(
            keyboardType: TextInputType.text,
            style: TextStyle(
              color: Colors.grey.shade800,
              fontSize: 16.0,
            ),
            decoration: const InputDecoration(
              labelText: "Notes",
              labelStyle: TextStyle(color: Colors.purple),
              border: OutlineInputBorder(), // Correct and uncommented border
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.purple),
              ), // Adds purple color for the enabled state
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.lightGreen),
              ), // Adds a focused border color
            ),
          ),
          const Divider(
            color: Colors.lightGreen,
            height: 50.0,
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Enter your notes',
              labelStyle: TextStyle(color: Colors.purple),
              border: UnderlineInputBorder(),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.purple),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.lightGreen),
              ),
            ),
          ),
        ],
      ),
    );
  }
}