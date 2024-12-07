import 'package:flutter/material.dart';

class AnimatedBalloonWidget extends StatefulWidget {
  const AnimatedBalloonWidget({super.key});

  @override
  _AnimatedBalloonWidgetState createState() => _AnimatedBalloonWidgetState();
}

class _AnimatedBalloonWidgetState extends State<AnimatedBalloonWidget>
    with TickerProviderStateMixin {
  late AnimationController _controllerFloatUp;
  late AnimationController _controllerGrowSize;
  late Animation<double> _animationFloatUp;
  late Animation<double> _animationGrowSize;

  @override
  void initState() {
    super.initState();
    _controllerFloatUp =
        AnimationController(duration: const Duration(seconds: 4), vsync: this);
    _controllerGrowSize =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    _animationFloatUp = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _controllerFloatUp, curve: Curves.easeInOut),
    );
    _animationGrowSize = Tween<double>(begin: 50.0, end: 150.0).animate(
      CurvedAnimation(parent: _controllerGrowSize, curve: Curves.elasticOut),
    );
    _controllerFloatUp.repeat(reverse: true);
    _controllerGrowSize.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controllerFloatUp.dispose();
    _controllerGrowSize.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double balloonHeight = MediaQuery.of(context).size.height / 2;
    double balloonWidth = MediaQuery.of(context).size.height / 3;
    double balloonBottomLocation =
        MediaQuery.of(context).size.height - balloonHeight;

    setState(() {
      _animationFloatUp = Tween<double>(
        begin: balloonBottomLocation,
        end: 0.0,
      ).animate(
        CurvedAnimation(
          parent: _controllerFloatUp,
          curve: Curves.fastOutSlowIn,
        ),
      );
    });

    return AnimatedBuilder(
  animation: _animationFloatUp,
  builder: (context, child) {
    return Container(
      margin: EdgeInsets.only(
        top: _animationFloatUp.value,
      ),
      width: _animationGrowSize.value,
      child: child,
    );
  },
  child: GestureDetector(
    onTap: () {
      if (_controllerFloatUp.isCompleted) {
        _controllerFloatUp.reverse();
        _controllerGrowSize.reverse();
      }
      else {
        _controllerFloatUp.forward();
        _controllerGrowSize.forward();
      }
    },
    child: Image.asset(
        'assets/images/balloon.jpg',
        height: balloonHeight,
        width: balloonWidth),
  ),
 );
  }
}