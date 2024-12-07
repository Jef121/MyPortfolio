import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Enhanced Mood',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MoodTrackerHome(title: 'My Mood'),
    );
  }
}

class MoodTrackerHome extends StatefulWidget {
  const MoodTrackerHome({super.key, required this.title});
  final String title;

  @override
  State<MoodTrackerHome> createState() => _MoodTrackerHomeState();
}

class _MoodTrackerHomeState extends State<MoodTrackerHome>
    with TickerProviderStateMixin {
  bool _showHappy = true;
  double _size = 100.0;
  double _opacity = 1.0;
  late AnimationController _floatController;
  late Animation<Offset> _floatAnimation;

  @override
  void initState() {
    super.initState();

    _floatController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );

    _floatAnimation = Tween<Offset>(
      begin: const Offset(-1.0, -1.0),
      end: const Offset(1.0, 1.0),
    ).animate(CurvedAnimation(
      parent: _floatController,
      curve: Curves.easeInOut,
    ));

    _floatController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _floatController.dispose();
    super.dispose();
  }

  void _toggleMood() {
    setState(() {
      _showHappy = !_showHappy;
    });
  }

  void _animateSize() {
    setState(() {
      _size = _size == 100.0 ? 200.0 : 100.0;
    });
  }

  void _fadeBackground() {
    setState(() {
      _opacity = _opacity == 1.0 ? 0.5 : 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent[400],
        title: Text(widget.title),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      backgroundColor: Colors.blue[900],
      body: SafeArea(
        child: Stack(
          children: [
            AnimatedBuilder(
              animation: _floatAnimation,
              builder: (context, child) {
                return Transform.translate(
                  offset: _floatAnimation.value *
                      MediaQuery.of(context).size.width /
                      2,
                  child: child,
                );
              },
              child: const FlutterLogo(size: 60),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Fun',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 100,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Text(
                  'Animation',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 50),
                AnimatedMoodWidget(
                  showHappy: _showHappy,
                  size: _size,
                  onTap: _animateSize,
                ),
                const SizedBox(height: 16),
                const Divider(),
                MoodToggleWidget(
                  showHappy: _showHappy,
                  onToggle: _toggleMood,
                ),
                const SizedBox(height: 16),
                const Divider(),
                BackgroundFadeWidget(
                  opacity: _opacity,
                  onFade: _fadeBackground,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedMoodWidget extends StatelessWidget {
  const AnimatedMoodWidget({
    super.key,
    required this.showHappy,
    required this.size,
    required this.onTap,
  });

  final bool showHappy;
  final double size;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: showHappy ? Colors.yellow : Colors.red,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            showHappy ? "😊" : "😠",
            style: const TextStyle(fontSize: 48),
          ),
        ),
      ),
    );
  }
}

class MoodToggleWidget extends StatelessWidget {
  const MoodToggleWidget({
    super.key,
    required this.showHappy,
    required this.onToggle,
  });

  final bool showHappy;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 500),
      crossFadeState:
          showHappy ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      firstChild: GestureDetector(
        onTap: onToggle,
        child: Container(
          color: Colors.yellow,
          padding: const EdgeInsets.all(16.0),
          child: const Text(
            "I am Happy!",
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
        ),
      ),
      secondChild: GestureDetector(
        onTap: onToggle,
        child: Container(
          color: Colors.red,
          padding: const EdgeInsets.all(16.0),
          child: const Text(
            "I am Angry!",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class BackgroundFadeWidget extends StatelessWidget {
  const BackgroundFadeWidget({
    super.key,
    required this.opacity,
    required this.onFade,
  });

  final double opacity;
  final VoidCallback onFade;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onFade,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 500),
        opacity: opacity,
        child: Container(
          color: Colors.black,
          height: 100.0,
          width: double.infinity,
          child: const Center(
            child: Text(
              "Tap me",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
