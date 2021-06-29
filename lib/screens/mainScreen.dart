import 'package:flutter/material.dart';
import 'package:task1/screens/drag.dart';
import 'package:task1/screens/rotation.dart';
import 'package:task1/screens/scale.dart';
import 'package:task1/screens/slider.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Gestures and Widgets')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Scale(),
                      ));
                },
                child: Center(child: Text('Scale Demo'))),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Drag(),
                      ));
                },
                child: Center(child: Text('Drag Demo'))),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RotatingBox(),
                      ));
                },
                child: Center(child: Text('Rotating Box'))),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VolumeSlider(),
                      ));
                },
                child: Center(child: Text('Slider')))
          ],
        ));
  }
}
