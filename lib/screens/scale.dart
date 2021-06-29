import 'package:flutter/material.dart';

class Scale extends StatefulWidget {
  @override
  _ScaleState createState() => _ScaleState();
}

class _ScaleState extends State<Scale> {
  double _height = 50;
  double _width = 50;
  Color _color = Colors.blue;
  double rotateX = 0;
  double rotateY = 0;

  double changeAxis = 0;
  void _scaleIncreaseEvent() {
    setState(() {
      _height = 200;
      _width = 200;
      _color = Colors.black;
      changeAxis = 0.5;
      rotateX = 0.7;
      rotateY = 0.5;
    });
  }

  void _scaleDefaultEvent() {
    setState(() {
      _height = 50;
      _width = 50;
      _color = Colors.blue;
      changeAxis = 0;
      rotateX = 0;
      rotateY = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scale')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('You can drag too'),
          SizedBox(height: 10),
          Center(
            child: Draggable(
              feedback: Container(
                height: _height,
                width: _width,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
              ),
              child: AnimatedContainer(
                transform: Matrix4.translationValues(changeAxis, 0, 0)
                  ..rotateX(rotateX)
                  ..rotateY(rotateY),
                duration: Duration(seconds: 2),
                height: _height,
                width: _width,
                color: _color,
              ),
            ),
          ),
          TextButton(onPressed: _scaleIncreaseEvent, child: Text('Change it')),
          TextButton(onPressed: _scaleDefaultEvent, child: Text('Default'))
        ],
      ),
    );
  }
}
