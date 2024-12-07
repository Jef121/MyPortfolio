import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade900),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Balloon Animation'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: const SafeArea(
        child: AnimatedBalloonWidget(),
      ),
    );
  }
}

class AnimatedBalloonWidget extends StatefulWidget {
  const AnimatedBalloonWidget({super.key});

  @override
  _AnimatedBalloonWidgetState createState() => _AnimatedBalloonWidgetState();
}

class _AnimatedBalloonWidgetState extends State<AnimatedBalloonWidget>
    with TickerProviderStateMixin {
  late AnimationController _controllerHorizontal;
  late AnimationController _controllerVertical;
  late Animation<double> _animationHorizontal;
  late Animation<double> _animationVertical;

  bool moveToTop = true;

  @override
  void initState() {
    super.initState();
    _controllerHorizontal = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _controllerVertical = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    // Horizontal movement (left to right)
    _animationHorizontal = Tween<double>(begin: 0.0, end: 300.0).animate(
      CurvedAnimation(parent: _controllerHorizontal, curve: Curves.easeInOut),
    );

    // Vertical movement toggling between top and bottom
    _animationVertical = Tween<double>(begin: 0.0, end: 500.0).animate(
      CurvedAnimation(parent: _controllerVertical, curve: Curves.easeInOut),
    );

    // Start the animations
    _controllerHorizontal.repeat(reverse: true);
    _controllerVertical.repeat(reverse: false);
  }

  @override
  void dispose() {
    _controllerHorizontal.dispose();
    _controllerVertical.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([_animationHorizontal, _animationVertical]),
      builder: (context, child) {
        return Stack(
          children: [
            Positioned(
              left: _animationHorizontal.value,
              top: moveToTop ? _animationVertical.value : MediaQuery.of(context).size.height - 100.0,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    moveToTop = !moveToTop;
                  });
                },
                child: Image.asset(
                  'assets/images/balloon.jpg',
                  height: 100,
                  width: 100,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
