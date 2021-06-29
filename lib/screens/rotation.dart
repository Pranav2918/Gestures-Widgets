import 'dart:math';

import 'package:flutter/material.dart';

class RotatingBox extends StatefulWidget {
  @override
  _RotatingBoxState createState() => _RotatingBoxState();
}

class _RotatingBoxState extends State<RotatingBox>
    with SingleTickerProviderStateMixin {
  double _height = 50;
  double _width = 50;
  Color _color = Colors.blue;
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    )..repeat();

    animation = Tween<double>(begin: 0, end: 2 * pi).animate(controller);
  }

  void _animation() {
    setState(() {
      _height = 150;
      _width = 150;
      _color = Colors.black;
    });
  }

  void _resetAnimation() {
    setState(() {
      _height = 50;
      _width = 50;
      _color = Colors.blue;
    });
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text('Rotating Box')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Tap..'),
            SizedBox(height: 20),
            Center(
              child: AnimatedBuilder(
                animation: animation,
                child: GestureDetector(
                  onTap: _animation,
                  child: AnimatedContainer(
                      color: _color,
                      width: _width,
                      height: _height,
                      duration: Duration(milliseconds: 500)),
                ),
                builder: (context, child) => Transform.rotate(
                  angle: animation.value,
                  child: child,
                ),
              ),
            ),
            SizedBox(height: 20),
            TextButton(onPressed: _resetAnimation, child: Text('Reset'))
          ],
        ),
      );
}
